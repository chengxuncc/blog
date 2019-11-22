---
title: "Software protation platform using high cpu while activating Office"
date: 2019-10-01T07:44:13+08:00
showDate: true

tags: ['Office','Windows']
categories: ['Windows']
noSummary: false
author: "Andro West"

---

1. Delete   
    C:\Windows\System32\spp\store_test\{data.dat,tokens.dat}  
    C:\Windows\System32\spp\store_test\cache\cache.dat.

2. Change directory name  
    C:\Windows\System32\spp\tokens  
    to  
    C:\Windows\System32\spp\tokens_bak




Another possibility: too many Winodws Product Activation keys on registry that locates at HKEY_LOCAL_MACHINE\SYSTEM\WPA


>[Solution][1]:
>
>1. boot to an WinPE or Recovery console
>2. backupcopy c:\windows\system32\config\software to software.save (you know what to do if the system crashes on boot)
>3. in regedit :
>a) allow permission to HKLM\System\WPA
>b) dont touch the first 3 subentries but delete all others (there are webblogs which state >that MediaCenter would not work after - havent checked that)
>4. reboot and see if that helped



__Debug__ sppsvc.exe: [Download Process Monitor](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon) and add a filter that process name is sppsvc.exe



[1]:https://answers.microsoft.com/en-us/windows/forum/windows_7-performance/sppsvcexe-is-using-too-much-processor-resources/9554c637-c06c-43d2-ade1-6d3ecd51c9d3?msgId=85ce469e-63f9-4885-b8a8-a5c28cb05a96&tab=MoreHelp#LastReply	"sppsvc.exe is using too much processor resources"