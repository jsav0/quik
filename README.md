# quik - mispelt script for deploying vps' quikly

#### Digital Ocean API Key
To obtain a Digital Ocean API Key, you can sign up with my [referral link](https://m.do.co/c/c5ace8d7755e) (You get a free $100 credit). 

## Download:
source is NOT hosted on github. git it from here
```
git clone git://wfnintr.net/quik /opt/quik && ln -s /opt/quik /usr/local/bin/
```

## Usage:
**1. Pick an appropriate resource size (consider budget, run time, # of desired instances):**
```
# list all possible options
quik list -l

# list all options considering a budget of $1USD, 1hr, 1 instance
quik list 1 1 1
```

**2. Deploy**
```
# deploy a single instance
quik deploy 1gb ~/.ssh/id_ed25519.pub 1

# deploy 10 instances
quik deploy 1gb ~/.ssh/id_ed25519.pub 1
```

**3. That's it.** Login to the running instances with  
```
ssh void@ip
```

---

|other commands|description|
|:-------------|:----------|
|`quik list-running`|show all running instances|
|`quik rm-all`|remove all running instances|

---

# TODO:
- There is a lot to do.
I have intentions to build quik out with predefined drist playbooks for certain types of environments.  

---

# About and Contributors 
This section doesn't need to be here but i wanted to add it. Might remove it later.  
I have long been a user of voidlinux and use it as a base for many of my projects (including raspberry pis, containerization, offensive hacking, tor relays, wireguard servers) because it's minimal, lightweight, free of a bloated installer, free of systemd, etc, the list of benefits goes on, imo.

So why is that relevant?   

Well, quik is my idea for deploying void linux instances quickly onto cloud infrastructure and automating the configuration of those instances.   
Up until now, Vultr has been the only vps provider i found which permitted me to upload and run custom void linux images without any issue. But they don't have a cli api like digital ocean does. And I want to take advantage of those 24vcpu 128gb resources that digital ocean provides. So it's perfect, i thought. I'll switch to dgital ocean and i'll automate it.  
Sure, there are other projects that perform similar functions as this. But they're bigger, uglier, and *not* automated with sh. And did i mention void linux? I had to take some extra steps to get void linux built and added to the digital ocean images repository. I suppose I need to add those instructions to the readme or you won't be able to use it.
So what started as an idea quickly turned into a script being passed back and forth over irc for a couple of hours which turned into quik. And for that, I thank my friends for being a part of it.   

- `haydenh` is the top contributor writing/re-writing everything is his wake ensuring this is efficient, free of bashisms and POSIX-compliant. He is responsible for the core functions.    

More are welcome. No bash. Less is more.  

Join us on hlirc.haydenvh.com [channel #quik]  
