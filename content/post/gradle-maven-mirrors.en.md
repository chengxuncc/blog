---
title: "Gradle setting aliyun mirror"
date: 2018-11-21T00:41:13+08:00

tags: ['Gradle','Mirror']
categories: ['IDEA','Android Studio']
noSummary: true
author: "Android West"

resizeImages: false
---
Create a new file on user directory of __.gradle__ directory named init.gradle for Gradle init script.

Such as: C:\Users\chengxuncc\\.gradle\init.gradle

Edit init.gradle and fill with:
```
allprojects{
    repositories {
        maven {
            url 'https://maven.aliyun.com/repository/public'
            url 'https://maven.aliyun.com/repository/jcenter'
        }
        mavenCentral()
        jcenter()
    }
}
```

Finally, Add this to project's file settings.gradle on the __first__ line:
```
pluginManagement {
    repositories {
        maven {
            url 'https://maven.aliyun.com/repository/gradle-plugin'
        }
        gradlePluginPortal()
    }
}
```
