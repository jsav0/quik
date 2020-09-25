#!/bin/sh
#
# haydenh's httpd (hhttpd)
# Created by Hayden Hamilton
#
# haydenvh.com
# Copyright (c) 2020 Hayden Hamilton
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# This work is free. You can redistribute it and/or modify it under the      
# terms of the Do What The Fuck You Want To Public License, Version 2,       
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.   

# Run script from xinetd
# Script will serve files from the directory provided as it's first argument
# for example, if the script is run as `/home/httpd/bin/httpd.sh /srv/www`
# files from the directory /srv/www/ will be served.
#
# converts *.gph files into html, and has a gateway for external gopher content

# configuration
hostname="haydenvh.com"
# use torsocks for gopher gateway
tor="" # make empty if you wish to disable it
# mapped mime types
mimemap(){
	case "$1" in
		png|gif|jpeg|jpg|webp) mime="image/$1" ;;
		flac|mp3|ogg|m4a|m3u) mime="audio/$1" ;;
		xml) mime="application/xml" ;;
		rss|xhtml|svg) mime="application/$1+xml" ;;
		iso) mime="application/x-iso9660-image" ;;
		*) text="yes"; mime="text/plain" ;;
	esac
}


# main
echo(){
	printf "%s\n" "$@"
}

headers(){
	printf "HTTP/1.1 200 OK\r\n"
	printf "Date: $(date '+%a, %d %b %Y %H:%M:%S %Z')\r\n"
	printf "X-Future: USE GOPHER\r\n"
	printf "X-Use-Gopher: gopher://$hostname\r\n"
	printf "Server: haydenh's httpd\r\n"
	printf "X-Server-Source: gopher://haydenvh.com/0/scripts/other/httpd.sh\r\n"
	printf "Host: $hostname\r\n"
	printf "X-Running-On: $(uname -o) $(uname -m) $(sed 's/.*="//g;s/"$//g' < /etc/os-release | tail -n 1) $(ldd 2>&1 | head -n 1 | sed 's/(.*//;s/libc//')\r\n"
	printf "Connection: close\r\n"
}

plain(){
	headers
	[ -z $1 ] && printf "Content-Type: text/plain; charset=utf-8\r\n" || printf "Content-Type: $1\r\n"
	printf "Content-Length: $(awk '{printf("%s\r\n", $0)}' < /dev/stdin | wc -c)\r\n"
	printf "\r\n"
	awk '{printf("%s\r\n", $0)}' < /dev/stdin
	exit 0
}

gopher2html(){
	file=$(echo "<style>*{margin:0;font-family:monospace;font-size:12px;text-decoration:none;}</style>"; awk -v "hostname=$hostname" '
		BEGIN {
			link=1
			FS="|"
		}

		/^\[.*\]$/ {
			gsub(/^\[/, "")
			gsub(/\]$/, "")
			link=0
		        switch ($1) {
				case "0":
					type = "Text";
					break;
				case "1":
					type = "Dir ";
					break;
				case "2":
					type = "CCSO";
					break;
				case "4":
				case "5":
				case "9":
					type = "Bin ";
					break;
				case "7":
					type = "Srch";
					break;
				case "8":
				case "T":
					type = "Teln";
					break;
				case "+":
					type = "Alt ";
					break;
				case "g":
				case "I":
					type = "Img ";
					break;
				case "h":
					type = "HTML";
					break;
				case "s":
					type = "Snd ";
					break;
				case "d":
					type = "Doc ";
					break;
				default:
					type = "?["$1"]";
			}
			if ($1 == "7")
				printf "<pre> Srch | "$2" <b>(since you are veiwing this via the web, you are unable to interact with gopher search engines)</pre></b>"
			else if ($4 == "server") 
				printf "<a href=\""$3"\"><pre> "type" | "$2"</pre></a>"
			else
				print "<a href=\"http://"hostname"/?gopher="$4":"$5"/"$1"/"$3"\"><pre> "type" | "$2"</pre></a>"
		}

		// {
			if (link == 1)
				print "<pre>      | "$0"</pre>"
			link=1
		}
	' | sed 's/      | t/      | /'; echo "<br /><i><pre>   This page was generated via <b>hhttpd</b> (http://haydenvh.com/scripts/other/httpd.sh) from geomyidae gopher content.
   You <b>should</b> be using gopher directly, if possible.</pre></i>")
   	echo "$file" | grep '<pre>.*' >/dev/null && {
		headers
	} || return404
	printf "Content-Type: text/html; charset=utf-8\r\n"
	printf "Content-Length: $(echo "$file" | awk '{printf("%s\r\n", $0)}' | wc -c)\r\n"
	printf "\r\n"
	echo "$file" | awk '{printf("%s\r\n", $0)}'
	exit 0
}

gopher2html2(){
	file=$(echo "<style>*{margin:0;font-family:monospace;font-size:12px;text-decoration:none;}</style>"; sed 's/^./&	/' < /dev/stdin | awk -v "hostname=$hostname" '
		BEGIN {
			FS="	"
		}

		// {
			link=0
		        switch ($1) {
				case "0":
					type = "Text";
					break;
				case "1":
					type = "Dir ";
					break;
				case "2":
					type = "CCSO";
					break;
				case "4":
				case "5":
				case "9":
					type = "Bin ";
					break;
				case "7":
					type = "Srch";
					break;
				case "8":
				case "T":
					type = "Teln";
					break;
				case "+":
					type = "Alt ";
					break;
				case "g":
				case "I":
					type = "Img ";
					break;
				case "h":
					type = "HTML";
					break;
				case "s":
					type = "Snd ";
					break;
				case "d":
					type = "Doc ";
					break;
				default:
					type = "?["$1"]";
			}
			if ($1 == "7")
				printf "<pre> Srch | "$2" <b>(since you are veiwing this via the web, you are unable to interact with gopher search engines)</pre></b>"
			else if ($1 == "i")
				print "<pre>      | "$2"</pre>"
			else
				print "<a href=\"http://"hostname"/?gopher="$4":"$5"/"$1"/"$3"\"><pre> "type" | "$2"</pre></a>"
		}

		// {
			if (link == 1)
				print "<pre>      | "$0"</pre>"
			link=1
		}
	' | sed 's/      | t/      | /'; echo "<br /><i><pre>   This page was generated via <b>hhttpd</b>'s (http://haydenvh.com/scripts/other/httpd.sh) external gopher gateway.
   You <b>should</b> be using gopher directly, if possible.</pre></i>")
   	echo "$file" | grep '<pre>.*|' >/dev/null && {
		headers
	} || return404
	printf "Content-Type: text/html; charset=utf-8\r\n"
	printf "Content-Length: $(echo "$file" | awk '{printf("%s\r\n", $0)}' | wc -c)\r\n"
	printf "\r\n"
	echo "$file" | awk '{printf("%s\r\n", $0)}'
	exit 0
}

return404(){
	echo "404: it doesn't exist :(" | plain
	exit 0
}

dirlist(){
	cd "$1"
	ls | while IFS= read -r file
	do
		[ -d $file ] && echo "[1|$file|$file|server|port]"
		[ -f $file ] && {
			echo "$file" | grep '\.dcgi$' && echo "[1|$file|$file|server|port]" && continue
			ftype=$(file "$file")
			echo "$ftype" | grep -i 'text' >/dev/null && echo "[0|$file|$file|server|port]" && continue
			echo "[9|$file|$location/$file|server|port]"
		}
	done | gopher2html
	exit 0
}

binary(){
	printf "HTTP/1.1 200 OK\r\n"
	printf "Date: $(date '+%a, %d %b %Y %H:%M:%S %Z')\r\n"
	printf "X-Future: USE GOPHER\r\n"
	printf "X-Use-Gopher: gopher://$hostname\r\n"
	printf "Server: haydenh's httpd\r\n"
	printf "X-Server-Source: gopher://haydenvh.com/0/scripts/other/httpd.sh\r\n"
	printf "Host: $hostname\r\n"
	printf "X-Running-On: $(uname -o) $(uname -m) $(sed 's/.*="//g;s/"$//g' < /etc/os-release | tail -n 1) $(ldd 2>&1 | head -n 1 | sed 's/(.*//;s/libc//')\r\n"
	printf "Connection: keep-alive\r\n"
	printf "Accept-Ranges: bytes\r\n"
	printf "Content-Type: $1\r\n"
	printf "Content-Length: $(wc -c < /dev/stdin)\r\n"
	printf "\r\n"
	cat /dev/stdin
}

dir="$1"
head=$(head -n 1)
location=$(echo "$head" | awk '$1 = "GET" {print $2}')
[ -d $dir/$location ] && {
	[ -f $dir/$location/index.html ] && plain "html" < "$dir/$location/index.html" && exit
	[ -f $dir/$location/index.txt ] && plain < "$dir/$location/index.txt" && exit
	[ -f $dir/$location/index.gph ] && gopher2html "$location" < "$dir/$location/index.gph" && exit
	[ -f $dir/$location/index.dcgi ] && cd $dir/$location && $dir/$location/index.dcgi | gopher2html && exit
	dirlist "$dir/$location"
} || {
	echo "$location" | grep '/\?gopher=[^/]*/[^1]' >/dev/null && $tor curl "gopher://$(echo "$location" | sed 's/.*\?gopher=//;s~//~/~g')" 2>/dev/null | plain && exit
	echo "$location" | grep '/\?gopher=' >/dev/null && $tor echo "gopher://$(echo "$location" | sed 's/.*\?gopher=//;s~//~/~g')" 2>/dev/null | head -n -1 | gopher2html2 && exit
	echo "$location" | grep '\.dcgi$' >/dev/null && cd $(dirname $dir/$location) && $dir/$location | gopher2html && exit
	[ ! -f $dir/$location ] && return404
	mimemap "$(echo "$location" | awk -F"." '{print $NF}')"
	[ "$text" = "yes" ] && plain "$mime" < "$dir/$location" || binary "$mime" < "$dir/$location"
}
