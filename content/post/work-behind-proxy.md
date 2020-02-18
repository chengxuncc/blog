---
title: "Work behind proxy"
date: 2019-11-28T16:06:16+08:00
showDate: true

tags: ['Golang','Proxy','Git','Linux']
categories: ['Proxy']
noSummary: false
author: "Andro West"
---

## Git
```bash
git config --global http.proxy http://127.0.0.1:1080
git config --global https.proxy http://127.0.0.1:1080
```

## Docker
docker daemon  
```bash
#linux
mkdir /usr/lib/systemd/system/docker.service.d/
echo '[Service]
Environment="HTTP_PROXY=https://127.0.0.1:1080/" "HTTPS_PROXY=https://127.0.0.1:1080/" 
' > /usr/lib/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload
systemctl restart docker
```

docker container
```bash
echo '
{
    "proxies": {
        "default": {
            "httpProxy": "http://127.0.0.1:1080",
            "httpsProxy": "http://127.0.0.1:1080",
            "noProxy": "10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
        }
    }
}
' > ~/.docker/config.json
```

## Linux common
permanently
```bash
echo '
no_proxy=localhost,*.local,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,::1/128,fe80::/10
NO_PROXY=localhost,*.local,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,::1/128,fe80::/10
http_proxy=http://127.0.0.1:1080
HTTP_PROXY=http://127.0.0.1:1080
https_proxy=http://127.0.0.1:1080
HTTPS_PROXY=http://127.0.0.1:1080
' >> /etc/environment
```

temporarily
```bash
export http_proxy=http://127.0.0.1:1080
export HTTP_PROXY=http://127.0.0.1:1080
export https_proxy=http://127.0.0.1:1080
export HTTPS_PROXY=http://127.0.0.1:1080
```

## Go get
```bash
echo '
GOPROXY=https://goproxy.io/
' >> /etc/environment
```

## Scoop
```
scoop config proxy 127.0.0.1:1080
```

## Powershell
$Home\Documents\WindowsPowerShell\Profile.ps1
```
$env:http_proxy="http://127.0.0.1:1080"
$env:https_proxy="http://127.0.0.1:1080"
```