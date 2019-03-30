<!--
.. title: Searching For Files
.. slug: searching-for-files
.. date: 2019-03-30 16:28:19 UTC+08:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

# Searching for files
## Introduction
* locate
* find
* xargs
* touch
* stat
## locate
The locate program performs a rapid database search of pathnames, and then outputs
every name that matches a given substring.
```bash
locate bin/zip
locate zip | grep bin
```
* update datebase
```bash
sudo updatedb
```
* variants
	* mlocate
	* slocate

## find
```bash
find ~ | wc -l
find ~ -type {f,d} | wc -l
```
* type
	* b
	* c
	* d
	* f
	* l
* name
```bash
find ~ -type f -name "*.JPG" -size +1M | wc -l
```
* operator
```bash
find ~ \( -type f -not  -perm 0600 \) -or \( -type d -not -perm 0700 \)
```
* We would look for
all the files with permissions that are not 0600 and the directories with permissions that
are not 0700.
	* -and: Match if the tests on both sides of the operator are true.  May be shortened to -a. Note that when no operator is present, -and is implied by default.
	* -or 
	* -not
	* (): Usually the backslash character is used to escape them.
* Actions
	* delele
	* ls
	* print
	* quit: Output the full pathname of the matching file to standard output. This is the default action if no other action is specified. 
```bash
find ~ -print -and -type f -and -name '*.BAK'
```
* User-Defined Actions
```bash
-exec rm '{}' ';'
```
Again, since the brace and semicolon characters have special meaning to the shell, they must be quoted or escaped.
It’s also possible to execute a user-defined action interactively by using the -ok action in place of -exec.
```bash
find ~ -type f -name 'foo*' -exec ls -l '{}' +
```
The system only has to execute the ls command once.
* xargs
```bash
find ~ -type f -name 'foo*' -print | xargs ls -l 
```
* Options
	* depth
	* maxdepth levels
	* mindepth levels
	*
