---
title: How to move mediawiki from Ubuntu to WSL?
author: chencanyi
date: '2019-08-09'
slug: how-to-move-mediawiki-from-ubuntu-to-wsl
categories:
  - wsl
  - linux
tags:
  - php
  - apache2
  - mysql
  - Mediawiki
disable_comments: no
hide_authorbox: yes
---

## Problem
How to move mediawiki from ubuntu to wsl?
## Solution
### Prerequisite

* [wikifolder]: where your wiki locate
* [wikidb]: database wiki uses
* [wikidb_user]: user of database
Assuming we have two servers:

* Server 1
```
[wikifolder]: /var/www/html
[wikidb]: wikidb
[wikidb_user]: root
```
* Server 2
```
[wikifolder]: /var/www/html
[wikidb]: wikidb
[wikidb_user]: wikiuser
```
* php version consistency
```bash
$ php --version                                                  
PHP 7.0.33-10+ubuntu18.04.1+deb.sury.org+1 (cli) (built: Aug  7 2019 09:51:13) ( NTS )                                            
Copyright (c) 1997-2017 The PHP Group                            
Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies        
    with Zend OPcache v7.0.33-10+ubuntu18.04.1+deb.sury.org+1, Copyright (c) 1999-2017, by Zend Technologies             
```
Make sure your php version is compatible with `Mediawiki` version. Check [Compatibility#PHP](https://www.mediawiki.org/wiki/Compatibility#PHP).

* Install php7.0 in Ubuntu 18.04
```bash 
sudo apt-get install python3-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get install -y php7.0
sudo apt-get install php7.0-curl php7.0-dev php7.0-gd php7.0-imap php7.0-intl php7.0-mbstring php7.0-mysql php7.0-xml php7.0-zip
```
* Apache2 in WSL
```bash
sudo vi /etc/apache2/apache2.conf
## Add this at the end of file
# AcceptFilter http none
```
Old mediawiki is in Server 1. We’d like to back up it, then scp to Server 2, finally restore from it in Server 2. 
### backup database in Service 1
* First insert the following line into
```bash
# vi LocalSettings.php
$wgReadOnly = 'Dumping Database, Access will be restored shortly';
```
this can be removed as soon as the dump is completed.
```bash
mysqldump --default-character-set=binary -u root -p -h localhost --opt 
wikidb > wikidb-backup.sql
```
For more, See [Mysqldump_from_the_command_line](https://m.mediawiki.org/wiki/Special:MyLanguage/Manual:Backing_up_a_wiki#Mysqldump_from_the_command_line), and [Back up in schedule](https://m.mediawiki.org/wiki/Special:MyLanguage/Manual:Backing_up_a_wiki).

### backup website in Service 1
```bash
## Be cautious with your mediawiki version, for the compability php&mysql.
tar czpvf mediawiki-1.30.0-rc.0-backup.tar.gz /var/www/html
```
### Restore in Service 2
* Import the database backup
On the server on which you are restoring MediaWiki, ensure you have
	* a correctly-working instance of MySQL
	* a MySQL user with appropriate permissions, if you can’t use MySQL user root
```bash
mkdir mediawiki_backup && cd mediawiki_backup/
cp /mnt/c/Users/chencanyi/Videos/wikidb-backup.sql ~/mediawiki_backup/ # or you can use scp
```
* If a database exists and you want to entirely replace it from the backup. To destroy the database:
```bash
mysqladmin -u wikiuser -p drop wikidb
```
* Then to create a new database and restore from backup:

```bash
# Create mysql user wikiuser
sudo mysql -u root -p
mysql> GRANT ALL PRIVILEGES ON *.* TO wikiuser@localhost IDENTIFIED BY "2010.ccy";
mysqladmin -u wikiuser -p create wikidb
mysql -u wikiuser -p wikidb < wikidb-backup.sql
```
* Import the MediaWiki files
Assuming you are in Service 1.
```bash
scp ubuntu@Service1:~/mediawiki_backup/mediawiki-1.30.0-rc.0-backup.tar.gz ~/mediawiki_backup/
cd ~/mediawiki_backup/
tar -xvzf mediawiki-1.30.0-rc.0-backup.tar.gz
rm -fR [wikifolder]/
mv ./var/www/html/* [wikifolder]
```
* Remember to change the database settings in LocalSettings.php(such as wgDBname, wgDBuser, wgDBpasswd).
```bash
php /var/www/html/maintenance/update.php
```
* Restart apache2 & mysql
```bash
sudo service apache2 restart
sudo service mysql restart
```
### Check the configuration file
* IP

### Something more
* where to find database configure?
```bash
cd /var/www/html
vi LocalSettings.php
## Something like
## Database settings
$wgDBtype = "mysql";
$wgDBserver = "localhost";
$wgDBname = "wikidb";
$wgDBuser = "root";
$wgDBpassword = "2010.ccy";
```
Backing up a website in short is backing up web files and database.
## References
1. [https://m.mediawiki.org/wiki/Special:MyLanguage/Manual:Moving_a_wiki](https://m.mediawiki.org/wiki/Special:MyLanguage/Manual:Moving_a_wiki)
2. [https://blog.lilydjwg.me/2011/5/28/story-of-migrating-mediawiki.27048.html](https://blog.lilydjwg.me/2011/5/28/story-of-migrating-mediawiki.27048.html)
3. [Manual:Restoring a wiki from backup](https://m.mediawiki.org/wiki/Special:MyLanguage/Manual:Restoring_a_wiki_from_backup)
4. [Manual:Backing up a wiki](https://m.mediawiki.org/wiki/Special:MyLanguage/Manual:Backing_up_a_wiki#Running_mysqldump_with_Cron)
5. [https://blog.csdn.net/setoy/article/details/6562287](https://blog.csdn.net/setoy/article/details/6562287)
6. [一文彻底解决Ubuntu上PHP的安装以及版本切换](https://www.cnblogs.com/feiffy/p/8660737.html)
7. [Compatibility#PHP](https://www.mediawiki.org/wiki/Compatibility#PHP)
8. [Ubuntu18.04 安装MySQL](https://blog.csdn.net/weixx3/article/details/80782479)
9. [Failed to enable APR_TCP_DEFER_ACCEPT](https://blog.csdn.net/Allen_xiaofei/article/details/79839719)


