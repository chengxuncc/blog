---
title: "All about ed25519 private key in Golang"
date: 2019-11-28T15:26:02+08:00
showDate: true

tags: ['Golang','ed25519','PKCS8']
categories: ['Golang']
noSummary: false
author: "Andro West"

---


Require Go 1.13

```go
package main

import (
	"bytes"
	"crypto/ed25519"
	"encoding/pem"
	"errors"
	"fmt"
	"log"

	"github.com/youmark/pkcs8"
)

func main() {
	// Without Encryption
	fmt.Println(genED25519PEM(""))

	// With AES-256-CBC Encryption
	encPEM, err := genED25519PEM("123456")
	panicIF(err)
	fmt.Println(encPEM)

	// Decrypt PEM
	fmt.Println(decED25519PEM(encPEM, "123456"))
}

// if password is nil, private key PEM will not be encrypted
func genED25519PEM(password string) (string, error) {
	_, priv, err := ed25519.GenerateKey(nil)
	if err != nil {
		return "", err
	}

	pemBlock := &pem.Block{}
	if password == "" {
		pemBlock.Type = "PRIVATE KEY"
	} else {
		pemBlock.Type = "ENCRYPTED PRIVATE KEY"
	}
	pemBlock.Bytes, err = pkcs8.MarshalPrivateKey(priv, []byte(password), nil)
	if err != nil {
		return "", err
	}

	keyPEM := new(bytes.Buffer)
	err = pem.Encode(keyPEM, pemBlock)
	if err != nil {
		return "", err
	}
	return keyPEM.String(), nil
}

func decED25519PEM(keyPEM, password string) (decKeyPEM string, err error) {
	block, _ := pem.Decode([]byte(keyPEM))
	if block.Type != "ENCRYPTED PRIVATE KEY" {
		return "", errors.New("ENCRYPTED PRIVATE KEY only")
	}
	privI, err := pkcs8.ParsePKCS8PrivateKey(block.Bytes, []byte(password))
	if err != nil {
		return "", err
	}
	priv, err := pkcs8.MarshalPrivateKey(privI, nil, nil)
	if err != nil {
		return "", err
	}

	resKeyPEM := new(bytes.Buffer)
	err = pem.Encode(resKeyPEM, &pem.Block{
		Type:  "PRIVATE KEY",
		Bytes: priv,
	})
	return resKeyPEM.String(), err
}

func panicIF(errs ...interface{}) {
	for _, err := range errs {
		if e, ok := err.(error); ok && e != nil {
			log.Panic(e)
		}
	}
}
```

Verify with OpenSSL: `openssl pkey -in PRIVATE_KEY_FILE_YOU_SAVED`