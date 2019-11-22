---
title: "Golang MarshalJSON pointer vs value receviers"
date: 2019-03-17T14:27:41+08:00
showDate: true

tags: ["Golang","Json"]
categories: ["Golang"]
author: "Andro West"

---

> In general, all methods on a given type should have either value or pointer receivers, but not a mixture of both.


<!--more-->


__Wrong__ code here, value is mess up with pointer recevier function:
```
package main

import (
	"encoding/json"
	"fmt"
)

type User struct {
	Username string
	Password string
}

func (u *User) MarshalJSON() ([]byte, error) {
	return json.Marshal(&struct {
		MyMarshalJSON string
	}{
		MyMarshalJSON: "it should be shown.",
	})
}

func main() {
	u := User{
		Username: "golang",
		Password: "123456",
	}
	outputJson, _ := json.Marshal(u)
	fmt.Println(string(outputJson))
}

```
Output:
`{"Username":"golang","Password":"123456"}`

__Right__ code:
```
package main

import (
	"encoding/json"
	"fmt"
)

type User struct {
	Username string
	Password string
}

func (u *User) MarshalJSON() ([]byte, error) {
	return json.Marshal(&struct {
		MyMarshalJSON string
	}{
		MyMarshalJSON: "it should be shown.",
	})
}

func main() {
	u := User{
		Username: "golang",
		Password: "123456",
	}
	outputJson, _ := json.Marshal(&u)
	fmt.Println(string(outputJson))
}
```
Output:
`{"MyMarshalJSON":"it should be shown."}`

>If you pass a pointer to json.Marshal, and your reciever is a value, it WILL call the custom MashalJSON method on the value.    
>So general rule: __DON’T make your MarshalJSON reciever a pointer.__

Credit:    
[Today I Learned: Beware with pointer in Golang!](https://hackernoon.com/today-i-learned-beware-with-pointer-in-golang-7764f2060a93)    
[Custom JSON Marshalling in Go](http://choly.ca/post/go-json-marshalling/)    
[The Go Playground](https://play.golang.org/p/gS4UW4p4mHK)


