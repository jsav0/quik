# quik - mispelt script for deploying vps' quikly

#### Digital Ocean API Key
To obtain a Digital Ocean API Key, you can sign up with my [referral link](https://m.do.co/c/c5ace8d7755e). (free $100 credit)

## Download:
~~source is NOT hosted on github. git it from here:~~  
Ok, i put it on github also, but it may be outdated. Prefer my repo instead.

```
git clone git://wfnintr.net/quik 
```

i recommend you cloning to /opt/ and linking to $PATH like so:
```
git clone git://wfnintr.net/quik /opt/quik && ln -s /opt/quik /usr/local/bin/
```

## Usage:
**1. Pick an appropriate resource size (consider budget, run time, # of desired instances):**
```
# list all possible options
quik list -l
```

**2. Deploy**
```
# deploy a single instance
quik deploy 1gb 
# deploy 10 instances
quik deploy 1gb 10
```

**3. That's it.** Login to the running instances with  
```
ssh void@ip
```

Watch it deploy 10 instances:  
![watch it deploy 10 instances](http://wfnintr.net/images/demo_quik_is_quick.gif)


---

```
quik is a script for deploying vps' quickly

usage:
  quik <command>

available commands:
  auth          authenticate your digital ocean api key
  list          list options considering budget
  list -l       list all options
  deploy        deploy instance
  ls            show all instances
  ls-run        show running instances
  rm            remove instance
  rm-all        remove all instances

examples:
  quik deploy 1gb               deploy a single instance
  quik deploy 1gb 10            deploy 10 instances
  quik list 1 1 1               list all options for 1USD, 1/hr, 1 instance
```

---

## DO NOT CONSIDER ANY PLAYBOOKS IN THIS REPO AS FINAL

# TODO:
- There is a lot to do.
- add self expiry option for instances (in progress) 
- add regions for user selection or randomization (is this feasible?)


I have intentions to build quik out with predefined drist playbooks for certain types of environments. So in that regard,  
- playbooks for the following purposes:
	- .onion generator (wfnintr/mkonions)
	- tor relay (wfnintr/tor-bridge)
	- offensive hacking (wfnintr/darkvoid)
	- wireguard (wfnintr/wireguard-scripts)
	- irc bots and daemons , (coming soon)
	- more
---

# About and Contributors 
This section doesn't need to be here but i wanted to add it. Might remove it later.  
I have long been a user of voidlinux and use it as a base for many of my projects (including raspberry pis, containerization, offensive hacking, tor relays, wireguard servers) because it's minimal, lightweight, free of a bloated installer, free of systemd, etc, the list of benefits goes on, imo.

So why is that relevant?   

Well, quik started as my idea for deploying void linux instances quickly onto cloud infrastructure and automating the configuration of those instances.   
Up until now, Vultr has been the only vps provider i found which permitted me to upload and run custom void linux images without any issue. But they don't have a cli api like digital ocean does. And I want to take advantage of those 24vcpu 128gb resources that digital ocean provides. So it's perfect, i thought. I'll switch to dgital ocean and i'll automate it.  
Sure, there are other projects that perform similar functions as this. But they're bigger, uglier, and *not* automated with sh. And did i mention void linux? I had to take some extra steps to get void linux built and added to the digital ocean images repository. I suppose I need to add those instructions to the readme or you won't be able to use it.
So what started as an idea quickly turned into a script being passed back and forth over irc for a couple of hours which turned into quik. And for that, I thank my friends for being a part of it.   

- `haydenh` is a top contributor writing/re-writing everything is his wake ensuring this is efficient, free of bashisms and POSIX-compliant. 
- `Evelyn Martin` is a top contributor, expanding quik's overall functionality and ensuring this is free of bashisms and POSIX-compliant.`

More are welcome. 

Join us in:  
- **irc.nebulacentre.net** [channel *#general*]
- **hlirc.haydenvh.com** [channel *#quik*]
