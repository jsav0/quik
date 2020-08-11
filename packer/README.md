# building void for digital ocean droplet

It was only a matter of time before i needed to document this. So here it is.

These instructions may change. Things are still kind of new. 

1. Download the void-mklive repo
```
git clone https://github.com/void-linux/void-mklive.git
```

2. Checkout the 'do' branch
```
git checkout do 
```

3. Make the packer templates
```
cd packer
make all
```

5. Setup environment variables
```
export SPACES_BUCKET=""
export SPACES_REGION=""
export IMAGE_REGION=""
export DIGITALOCEAN_SPACES_SECRET_KEY=""
export DIGITALOCEAN_SPACES_ACCESS_KEY=""
export DIGITALOCEAN_API_TOKEN=""
```

4. Build
```
packer build templates/digitalocean-glibc64.json
```

---

If you're like me and can't (or don't want to) spawn the kvm console, you must modify the digitalocean-glibc64.json packer template and set qemu to start in "headless" mode. 
```
"type": "qemu",
"headless": "true",
```

Now, build again.  
```
packer build digitalocean-glibc64.json
```

Done. The image was built and added to your digital ocean repository. Nice. 


