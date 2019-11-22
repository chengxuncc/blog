---
title: "Disable Linux kernel ping echo"
date: 2019-03-03T22:33:33+08:00
showDate: true

tags: ["iptables"]
categories: ["Linux"]
noSummary: false
author: "Andro West"

resizeImages: false
#for external link
# link: "https://duckduckgo.com"
# target: "_blank"
---

For some reasons, I want to disable kernel icmp reply for an interface, but except my program's icmp reply which run as root(uid 0).

Dive into the code, eth0 is my interface name:
```
iptables -A OUTPUT -m owner ! --uid-owner 0 -p icmp --icmp-type echo-reply -o eth0 -j DROP
```
That mean it drop interface eth0's icmp reply output packets but mine (root -> uid 0).