---
title: "Netease Cloud Music playlist exporter"
date: 2018-12-18T00:27:13+08:00

tags: ['Netease Cloud Music','Python3']
categories: ['Python3']
noSummary: false
author: "Andro West"

resizeImages: false
---
Easy to export Netease Cloud Music playlist,for example,songs list url is https://music.163.com/playlist?id=898321616 ,then list id is that 898321616.
Python3 Required.    

<!--more-->

```
#!/usr/bin/python3
import json
import urllib.request as request
while True:
  try:
    id=input('Please input your list id:')
    url='https://api.bzqll.com/music/netease/songList?key=579621905&id='+id
    data=request.urlopen(url).read()
    data=json.loads(data)
  except:
    print("Playlist doesn't exist.")
    continue

  print('---------------------------------------------------------')
  for i in data['data']['songs']:
    print(i['name'],'--',i['singer'])

  print('-------All'+str(len(data['data']['songs']))+'songs-------')
```
