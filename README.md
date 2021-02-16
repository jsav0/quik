# quik - mispelt script for deploying vps' quickly
## Download:
```
git clone https://github.com/jsav0/quik
```

## Dependencies:
- `drist` : drist is a tool to configure remote servers in an Unix way.
  - `git clone git://bitreich.org/drist && sudo make install`
- `doctl` : official cli for the Digital Ocean API
- `vultr` : official cli for the Vultr API

## Install:
Use the provided makefile to install to /usr/local/bin/ 
```
sudo make install
```
Or just copy `quik` to the `$PATH` of your choice.   

quik currently supports deployment with the following VPS providers:
- Digital Ocean using `doctl`, auth via `$DO_TOKEN`
- Vultr using `vultr`, auth via `VULTR_API_KEY`

---

```
quik is a script for deploying vps' quickly

usage:
  quik <command>
  quik <provider> <command> <options>

quik commands:
  ls		list servers
  rm		remove servers

providers:
  doctl		Digtal Ocean
  vultr		Vultr

provider commands:
  deploy	deploy servers
  rm		remove servers
  ls		list servers

examples:
  quik doctl deploy 1gb 10 void-linux	deploy 10 instances running void linux
```

---


## TODO:
- add self expiry (self-destruct) option for instances (in progress, see self-destruct playbook) 
- add regions for user selection or randomization (done, but some regions are restricted, code commented out)

## PLAYBOOKS
ALL PLAYBOOKS HAVE BEEN MOVED TO: jsav0/drist-playbooks  
They may be coupled with quik to automate full deployments  
Some playbooks require my modified version of `drist` to copy the files back to the local machine.  
- example playbooks for the following purposes:
	- offensive hacking (wfnintr/darkvoid) 
	- .onion generator (wfnintr/mkonions)
	- tor relay (wfnintr/tor-bridge)
	- wireguard (wfnintr/wireguard-scripts)
	- xinetd (httpd, gopher, git)
	- irc bots and daemons 
	- target recon
	- subdomain enumeration
	- port scanning in parallel
	- more


---

## Contributors 

- `haydenh`
- `Evelyn Martin`

More are welcome. 

Join us in:  
- **irc.nebulacentre.net** [channel *#general*]
- **irc.hlirc.net** [channel *#hlircnet*]


#### Digital Ocean API Key
To obtain a Digital Ocean API Key, you can sign up with my [referral link](https://m.do.co/c/c5ace8d7755e). (free $100 credit)
