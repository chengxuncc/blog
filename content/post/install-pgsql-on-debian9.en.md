---
title: "How to Install PostgreSQL 11 on Debian 9 (Stretch)"
date: 2018-12-27T10:12:57+08:00

tags: ['Debian','PostgreSQL','APT']
categories: ['Linux']
author: "Andro West"

resizeImages: false
---
The PostgreSQL Global Development Group (PGDG) maintains an APT repository of PostgreSQL packages for Debian and Ubuntu located at http://apt.postgresql.org/pub/repos/apt/.     


Import the repository key from https://www.postgresql.org/media/keys/ACCC4CF8.asc :
```
apt install curl ca-certificates
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add  - 
```

Create /etc/apt/sources.list.d/pgdg.list:
```
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
```

Finally, update the package lists, and start installing packages:
```
apt update
apt install postgresql-11
```
start PostgreSQL：`systemctl start postgresql`    
set PostgreSQL run at startup：`systemctl enable postgresql`    
To start the PostgreSQL console: `sudo -u postgres psql`    

credit: https://wiki.postgresql.org/wiki/Apt