---
title: "Elvish Shell Code Snippets"
date: 2019-12-11T10:23:22+08:00
showDate: true

tags: ["elvish","shell"]
categories: ["elvish"]
noSummary: false
author: "Andro West"
---

## change to script's directory
```
cd (path-dir (src)[path])
```

## check file or  directory exists
```
test NAME
test -f FILENAME
test -d DIRECTORYNAME

if (not ?(test -d DIRECTORY/SUBDIRECTORY)) {
    mkdir -p DIRECTORY/SUBDIRECTORY
}

if (not ?(test -f FILENAME)) {

}

if (not ?(nop <FILENAME)) {
    
}
```

## 
