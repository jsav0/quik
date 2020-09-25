# quik - mispelt script for deploying vps' quikly

#### Digital Ocean API Key
To obtain a Digital Ocean API Key, you can sign up with my [referral link](https://m.do.co/c/c5ace8d7755e). (free $100 credit)

## Download:
~~source is NOT hosted on github. git it from here:~~  
Ok, i put it on github also, but it may be outdated. Prefer my repo instead.
```
git clone git://wfnintr.net/quik 
```

## Install:
Use the provided makefile to install to /usr/local/bin/ 
```
sudo make install
```
Or just copy `quik` to the `$PATH` of your choice.   

## Usage:
**1. Pick an appropriate resource size (consider budget, run time, # of desired instances):**
```
quik list -l          # list all options
quik list 1 1 1       # only show options that fit a budget of 1/USD, 1/hr 1/instance
```

**2. Deploy**
```
quik deploy 1gb 1 void-linux	# deploy 1 instance 
quik deploy 1gb 10 void-linux	# deploy 10 instances
```

**3. That's it.** Login to the running instances with  
```
ssh void@ip
```

Watch it deploy 10 instances:  
![watch it deploy 10 instances](http://wfnintr.net/images/quik_demo_short.gif)

quik currently supports deployment of the following distros:  
( others can be deployed easily with a minor adjustment to the source. )
```
debian-10-x64		# user: root
centos-7-x64		# user: root
ubuntu-18-04-x64	# user: root
void-linux		# user: void
```

---

```
quik is a script for deploying vps' quickly

usage
  quik <command>

available commands:
  auth		authenticate your digital ocean api key
  list		list options considering budget
  list -l	list all options
  distros	show all supported distros
  deploy	deploy instance
  ls		show all instances
  ls-run	show running instances
  rm		remove instance
  rm-all	remove all instances

examples:
  quik list -l				list all options
  quik deploy 1gb 1 void-linux		deploy 1 instance running void linux
  quik deploy 1gb 10 debian-10-x64	deploy 10 instances running debian-10-x64
```

---


# TODO:
- There is a lot to do.
- add self expiry (self-destruct) option for instances (in progress) 
- add regions for user selection or randomization (done, but some regions are restricted, code commented out)
- ~~when an incorrect distro-name is passed, the script should call distro_list() and exit.~~ done
- ~~when an incorrect size-slug is passed, the script should call `list -l` and exit.~~ done

## PLAYBOOKS
*DO NOT CONSIDER ANY PLAYBOOKS IN THIS REPO AS FINAL , although some probably are*
- playbooks for the following purposes:
	- offensive hacking (wfnintr/darkvoid) 
	- .onion generator (wfnintr/mkonions)
	- tor relay (wfnintr/tor-bridge)
	- wireguard (wfnintr/wireguard-scripts)
	- xinetd (httpd, gopher, git)
	- irc bots and daemons 
	- more


---

# About and Contributors 
quik started as my idea (jsavage) for deploying void linux instances quickly onto cloud infrastructure and automating the deployment of configurations to those instances.
It quickly evolved into a fully capable script after being passed back and forth with others over irc. And for that, I thank my friends for being a part of it.   

- `haydenh`
- `Evelyn Martin`

More are welcome. 

Join us in:  
- **irc.nebulacentre.net** [channel *#general*]
- **irc.hlirc.net** [channel *#quik*]
