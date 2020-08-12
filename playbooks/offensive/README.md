# offensive drist playbook for void linux
# Usage

1. define target server(s) in config.mk
```
echo 'SERVERS = user@server1 user@server2 user@server3' > config.mk
```

2. execute
```	
make
```

3. that's it.

---

# Example

	echo 'SERVERS = void@67.205.155.81' > config.mk && make

---
this mimicks my ansible darkvoid playbook, but drist is more simple, seriously.  
