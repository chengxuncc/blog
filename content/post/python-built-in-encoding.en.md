---
title: "Python built-in encoding"
date: 2018-12-05T01:07:13+08:00
showDate: true

tags: ['Python3','Encoding']
categories: ['Python3']
noSummary: false
author: "Andro West"

---
The built-in encoding of the Python3 string on Windows is Unicode. When using string.encode (), utf-8 transcoding of the string will be performed according to the built-in Unicode by default to obtain bytes of uft-8.

<!--more-->


When reading binary files (such as pictures and executable files), it should never be converted into strings and should be stored in bytes or arrays.

Look at an example:
```
x=[0xc2,0x50]
print('----list2bytes------')
for i in bytes(x):
  print(i)

s=''
for i in x:
  s+=chr(i)

print('----string2bytes----')
for i in s.encode():
  print(i)

print('----string2ord------')
for i in s:
  print(ord(i))
```

Output:
```white    
----list2bytes------  
194  
80  
----string2bytes----  
195  
130  
80  
----string2ord------  
194  
80  
```

And See that $\mathrm{Unicode(C2)} =  \mathrm{UTF8(C382)}$

[stackoverflow](https://stackoverflow.com/q/53578472/10503818)