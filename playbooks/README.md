
## Usage
1. Writing a new module is as simple as:
```
mkdir -p module/files && make ln && cd <module>
echo 'SERVERS = root@server' > config.mk
echo 'this is a file' > /tmp/file
```

2. Deploy 
```
cd <module> && make
```

    (NOTE: replace words, and their brackets, when surrounded with <angle brackets>)
