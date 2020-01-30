---
title: "Go common commands"
date: 2019-12-15T13:59:59+08:00
showDate: true

tags: ["Golang"]
categories: ["Golang"]
noSummary: false
author: "Andro West"
---
|Operation|Command|
|----|----|
|Update go mod dependencies|`go list -m -u all`|
|build smaller binary|`go build -trimpath -ldflags="-s -w"`|