<!--
.. title: Regular Expressions
.. slug: regular-expressions
.. date: 2019-04-01 22:32:57 UTC+08:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

# 19-Regular Expressions
## What are regular expressions?
Simply put, regular expressions are symbolic notations used to identify patterns in text.
## grep
* grep [options] regex [file...]
* global regular expression print
	* -i: Ignore case.
	* -v: Invert match. Match those unmatched.
	* -n: Prefix each matching with the number of the line within the file.
	* -l: Print the name of each file that contains a match instead of the lines themselves.
	* -L: Invert -l.
	* -h: For multi-file searches, suppress the output of the line.
## Metacharacters and Literals
* The characters in the string “bzip” are all literal characters, in that they match themselves.
* metacharacters
```
^ $ . [ ] { } - ? * + ( ) | \
```
* All other characters are considered literals, though the backslash character is used in a few cases to create meta sequences, as well as allowing the metacharacters to be escaped and treated as literals instead of being interpreted as metacharacters.
## The Any Character `.`
* If we include it in a regular expression, it will match any character in that character position.
```bash
grep -h '.zip' dirlist*.txt
```
## Anachors
The caret (^) and dollar sign ($) characters are treated as anchors in regular expressions.  This means that they cause the match to occur only if the regular expression is found at the beginning of the line (^) or at the end of the line ($).
```bash
chencanyi@DESKTOP-0HHN0UG:~$ grep -h '^zip' dirlist-*.txt
zip
zipcloak
zipdetails
zipgrep
zipinfo
zipnote
zipsplit
chencanyi@DESKTOP-0HHN0UG:~$ grep -h 'zip$' dirlist-*.txt
gunzip
gzip
funzip
gpg-zip
unzip
zip
chencanyi@DESKTOP-0HHN0UG:~$ grep -h '^zip$' dirlist-*txt
zip
```
* Note that the regular expression ‘^$’ (a beginning and an end with nothing in between) will match blank lines.
## Bracket expressions and character classes
* We can also match a single character from a specified set of characters by using bracket expressions.
* The first is the caret (^), which is used to indicate negation; the second is the dash (-), which is used to indicate a character range.
```bash
chencanyi@DESKTOP-0HHN0UG:~$ grep -h '[bg]zip' dirlist-*.txt
bzip2
bzip2recover
gzip
chencanyi@DESKTOP-0HHN0UG:~$ grep -h '[^bg]zip' dirlist-*.txt bunzip2
gunzip
funzip
gpg-zip
unzip
unzipsfx
chencanyi@DESKTOP-0HHN0UG:~$ grep -h '[^A-Z]zip' dirlist-*.txt
bunzip2
bzip2
bzip2recover
gunzip
gzip
funzip
gpg-zip
unzip
unzipsfx
```
## Terminal and ASCII
`[a-z]` is not applied anymore in shell performing pathname expansion. It will follow dictionary order rather than ASCII order. We should use:
* [:alnum:]
* [:alpha:]
* etc.
## POSIX Basic Vs. Extended Regular Expressions
Just when we thought this couldn’t get any more confusing, we discover that POSIX also
splits regular expression implementations into two kinds: basic regular expressions
(BRE) and extended regular expressions (ERE).

We should use `egrep` or `grep -E`.
* The name “POSIX,” which stands for Portable Operating System Interface (with the “X” added to the end for extra snappiness), was suggested by Richard Stallman (yes, that Richard Stallman), and was adopted by the IEEE.
### Alternation `|`
```bash
chencanyi@DESKTOP-0HHN0UG:~$ echo "AAA" | egrep "AAA|BBB"
AAA
chencanyi@DESKTOP-0HHN0UG:~$ echo "BBB" | egrep "AAA|BBB"
BBB
chencanyi@DESKTOP-0HHN0UG:~$ echo "CCC" | egrep "AAA|BBB"
chencanyi@DESKTOP-0HHN0UG:~$ echo "BBB" | grep -E "AAA|BBB"
BBB
chencanyi@DESKTOP-0HHN0UG:~$ egrep -h "^(bz|gz|zip)" dirlist-*.txt
bzcat
bzcmp
bzdiff
bzegrep
bzexe
bzfgrep
bzgrep
bzip2
bzip2recover
bzless
bzmore
gzexe
gzip
zip
zipcloak
zipdetails
zipgrep
zipinfo
zipnote
zipsplit
```
## Quantifiers
### ?-Match an element zero or one time
* Match numbers like
```
(nnn) nnn-mmm
nnn nnn-mmm
```
```bash
chencanyi@DESKTOP-0HHN0UG:~$ echo "(555) 123-4567" | grep -E '^\(?[0-9][0-9][0-9]
\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
(555) 123-4567
chencanyi@DESKTOP-0HHN0UG:~$ echo "(aaa) 123-4567" | grep -E '^\(?[0-9][0-9][0-9]
\)? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
chencanyi@DESKTOP-0HHN0UG:~$ echo "555 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)
? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
555 123-4567                                                                     ```
### *-Match an element zero or more times
* Match a sentence.
```bash
chencanyi@DESKTOP-0HHN0UG:~$ echo "This works." | egrep "[[:upper:]][[:upper:][:lower:] ]* \."
chencanyi@DESKTOP-0HHN0UG:~$ echo "This works." | egrep "[[:upper:]][[:upper:][:lower:] ]*\."
This works.
```
### +-Match an element one or more times
```
^([[:alpha:]]+ ?)+$
```
### { } - Match An Element A Specific Number Of Times
```bash
chencanyi@DESKTOP-0HHN0UG:~$ echo "(555) 010-8888" | grep -E "^\(?[[:digit:]]{3}\)? [[:digit:]]{3}-[[:digit:]]{4}$"
(555) 010-8888
chencanyi@DESKTOP-0HHN0UG:~$ echo "(555) 010-8888" | grep -E "^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$"
(555) 010-8888
chencanyi@DESKTOP-0HHN0UG:~$ echo "(5555) 010-8888" | grep -E "^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$"
chencanyi@DESKTOP-0HHN0UG:~$ echo "(555 010-8888" | grep -E "^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$"
(555 010-8888
```
## Putting Regular Expressions To Work
* find wrong phonenumber
```bash
chencanyi@DESKTOP-0HHN0UG:~$ for i in {1..10}; do echo "(${RANDOM:0:3}) ${RANDOM:0:3}-${RANDOM:0-4}" >> phonelist.txt; done
chencanyi@DESKTOP-0HHN0UG:~$ cat phonelist.txt
(289) 155-7097
(248) 243-3957
(277) 125-5962
(276) 655-
(130) 205-5734
(102) 181-1950
(214) 247-0998
(135) 210-4210
(893) 319-7222
(646) 465-7882
(261) 224-8431
chencanyi@DESKTOP-0HHN0UG:~$ grep -Ev '^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$' phonelist.txt
(276) 655-
```
* Finding ugly filename with find
Whereas grep will print a line when the line contains a string that matches an expression, find requires that the pathname exactly match the regular expression. 
```bash
chencanyi@DESKTOP-0HHN0UG:~$ find . -regex '.*[^-_./0-9a-zA-Z].*'
```
* Searching for files with locate
The locate program supports both basic (the --regexp option) and extended (the
--regex option) regular expressions.
```bash
chencanyi@DESKTOP-0HHN0UG:~$ locate --regex 'bin/(bz|gz|zip)'
```
## More
```
cd /usr/share/man/man1
zgrep -El 'regex|regular expression' *.gz
```
