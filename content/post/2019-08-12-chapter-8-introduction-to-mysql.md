---
title: Chapter 8. Introduction to MySQL
author: chencanyi
date: '2019-08-12'
slug: chapter-8-introduction-to-mysql
categories:
  - Learning PHP
  - MySQL & JavaScript
tags:
  - mysql
disable_comments: no
hide_authorbox: yes
---


## Creating a MySQL Database

- login with user root

```bash
sudo mysql -u root -p
```

- `;`  is used for ending commands

  | Mysql prompt | Meaning                                                 |
  | ------------ | ------------------------------------------------------- |
  | mysql>       | Ready and waiting for a command                         |
  | ->           | Waiting for the next line of a command                  |
  | '>           |                                                         |
  | ">           |                                                         |
  | `>           |                                                         |
  | /*>          | Waiting for the next line for a comment started with /* |

- Canceling a command

  ```bash
  \c
  ```

  Don't press `Ctrl-C` which will interrupt the program.

  ![1565510829048](/images/note in LPMJ.assets/1565510829048.png)

![1565510856175](/images/note in LPMJ.assets/1565510856175.png)

- Creating a database

  ```bash
  mysql> create database publications;         Query OK, 1 row affected (0.01 sec)
  mysql> USE publications;                     
  Database changed
  ```

- Create users

  ```bash
  GRANT PRIVILEGES ON database.object TO 'username'@'hostname'
  IDENTIFIED BY 'password';
  ```

  ![1565511930348](/images/note in LPMJ.assets/1565511930348.png)

  ```bash
  mysql> quit                                 Bye
  # chencanyi @ DESKTOP-0HHN0UG in ~ [16:30:30]               
  $ mysql -u jim -p                                           
  Enter password:
  Welcome to the MySQL monitor.  Commands end with ; or \g.
  Your MySQL connection id is 9
  Server version: 5.7.27-0ubuntu0.18.04.1 (Ubuntu)
  
  Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.
  
  Oracle is a registered trademark of Oracle Corporation and/or its
  affiliates. Other names may be trademarks of their respective
  owners.
  
  Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
  
  mysql>
  ```

  - REVOKE can remove privileges once granted.
  - Also be aware that if you create a new user but
    do not specify an IDENTIFIED BY clause, the user will have no password, a situation that is very insecure and should be avoided. 

- Creating a table

  ```sql
  mysql> CREATE TABLE classics( author VARCHAR(128), title VARCHAR(128), type VARCHAR(16), year CHAR(4)) ENGINE InnoDB;
  Query OK, 0 rows affected (0.05 sec)
  ```

  

  Check whether your new table has been created.

  ```sql
  mysql> DESCRIBE classics;
  +--------+--------------+------+-----+---------+-------+
  | Field  | Type         | Null | Key | Default | Extra |
  +--------+--------------+------+-----+---------+-------+
  | author | varchar(128) | YES  |     | NULL    |       |
  | title  | varchar(128) | YES  |     | NULL    |       |
  | type   | varchar(16)  | YES  |     | NULL    |       |
  | year   | char(4)      | YES  |     | NULL    |       |
  +--------+--------------+------+-----+---------+-------+
  4 rows in set (0.02 sec)
  ```

  

- alter an existing table

  ```sql
  mysql> ALTER TABLE classics ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT KEY;
  Query OK, 0 rows affected (0.06 sec)
  Records: 0  Duplicates: 0  Warnings: 0
  
  mysql> DESCRIBE classics;
  +--------+------------------+------+-----+---------+----------------+
  | Field  | Type             | Null | Key | Default | Extra          |
  +--------+------------------+------+-----+---------+----------------+
  | author | varchar(128)     | YES  |     | NULL    |                |
  | title  | varchar(128)     | YES  |     | NULL    |                |
  | type   | varchar(16)      | YES  |     | NULL    |                |
  | year   | char(4)          | YES  |     | NULL    |                |
  | id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
  +--------+------------------+------+-----+---------+----------------+
  5 rows in set (0.00 sec)
  ```

  

- Adding data to a table

  ```sql
  INSERT INTO classics(author, title, type, year)
  VALUES('Mark Twain','The Adventures of Tom Sawyer','Fiction','1876');
  INSERT INTO classics(author, title, type, year)
  VALUES('Jane Austen','Pride and Prejudice','Fiction','1811');
  INSERT INTO classics(author, title, type, year)
  VALUES('Charles Darwin','The Origin of Species','Non-Fiction','1856');
  INSERT INTO classics(author, title, type, year)
  VALUES('Charles Dickens','The Old Curiosity Shop','Fiction','1841');
  INSERT INTO classics(author, title, type, year)
  VALUES('William Shakespeare','Romeo and Juliet','Play','1594');
  ```

  ```sql
  mysql> SELECT * FROM classics;
  +---------------------+------------------------------+-------------+------+----+
  | author              | title                        | type        | year | id |
  +---------------------+------------------------------+-------------+------+----+
  | Mark Twain          | The Adventures of Tom Sawyer | Fiction     | 1876 |  1 |
  | Mark Twain          | The Adventures of Tom Sawyer | Fiction     | 1876 |  2 |
  | Jane Austen         | Pride and Prejudice          | Fiction     | 1811 |  3 |
  | Charles Darwin      | The Origin of Species        | Non-Fiction | 1856 |  4 |
  | Charles Dickens     | The Old Curiosity Shop       | Fiction     | 1841 |  5 |
  | William Shakespeare | Romeo and Juliet             | Play        | 1594 |  6 |
  +---------------------+------------------------------+-------------+------+----+
  6 rows in set (0.00 sec)
  ```

-  Renaming a table

  ```sql
  mysql> ALTER TABLE classics RENAME pre1900;
  Query OK, 0 rows affected (0.01 sec)
  
  mysql> SELECT * FROM classics;
  ERROR 1146 (42S02): Table 'publications.classics' doesn't exist
  mysql> ALTER TABLE pre1900 RENAME classics;
  Query OK, 0 rows affected (0.01 sec)
  
  mysql> mysql> SELECT * FROM classics;
  +---------------------+------------------------------+-------------+------+----+
  | author              | title                        | type        | year | id |
  +---------------------+------------------------------+-------------+------+----+
  | Mark Twain          | The Adventures of Tom Sawyer | Fiction     | 1876 |  1 |
  | Mark Twain          | The Adventures of Tom Sawyer | Fiction     | 1876 |  2 |
  | Jane Austen         | Pride and Prejudice          | Fiction     | 1811 |  3 |
  | Charles Darwin      | The Origin of Species        | Non-Fiction | 1856 |  4 |
  | Charles Dickens     | The Old Curiosity Shop       | Fiction     | 1841 |  5 |
  | William Shakespeare | Romeo and Juliet             | Play        | 1594 |  6 |
  +---------------------+------------------------------+-------------+------+----+
  6 rows in set (0.00 sec)
  ```

  

- Changing the data type of a column

  ```sql
  mysql> ALTER TABLE classics MODIFY year SMALLINT;
  Query OK, 6 rows affected (0.07 sec)
  Records: 6  Duplicates: 0  Warnings: 0
  
  mysql> ALTER TABLE classics ADD pages SMALLINT UNSIGNED;
  Query OK, 0 rows affected (0.08 sec)
  Records: 0  Duplicates: 0  Warnings: 0
  ```

  

- Renaming a column

  ```sql
  mysql> ALTER TABLE classics CHANGE type category VARCHAR(16);
  Query OK, 0 rows affected (0.01 sec)
  Records: 0  Duplicates: 0  Warnings: 0
  
  mysql> DESCRIBE classics
      -> ;
  +----------+----------------------+------+-----+---------+----------------+
  | Field    | Type                 | Null | Key | Default | Extra          |
  +----------+----------------------+------+-----+---------+----------------+
  | author   | varchar(128)         | YES  |     | NULL    |                |
  | title    | varchar(128)         | YES  |     | NULL    |                |
  | category | varchar(16)          | YES  |     | NULL    |                |
  | year     | smallint(6)          | YES  |     | NULL    |                |
  | id       | int(10) unsigned     | NO   | PRI | NULL    | auto_increment |
  | pages    | smallint(5) unsigned | YES  |     | NULL    |                |
  +----------+----------------------+------+-----+---------+----------------+
  6 rows in set (0.00 sec)
  ```

  

- Removing a column

  ```sql
  mysql> ALTER TABLE classics DROP pages;
  Query OK, 0 rows affected (0.06 sec)
  Records: 0  Duplicates: 0  Warnings: 0
  ```

- Deleting a table

  ```sql
  mysql> create table disposable(trash int);
  Query OK, 0 rows affected (0.03 sec)
  
  mysql> describe disposable;
  +-------+---------+------+-----+---------+-------+
  | Field | Type    | Null | Key | Default | Extra |
  +-------+---------+------+-----+---------+-------+
  | trash | int(11) | YES  |     | NULL    |       |
  +-------+---------+------+-----+---------+-------+
  1 row in set (0.00 sec)
  
  mysql> drop table disposable;
  Query OK, 0 rows affected (0.01 sec)
  
  mysql> show tables
      -> ;
  +------------------------+
  | Tables_in_publications |
  +------------------------+
  | classics               |
  +------------------------+
  1 row in set (0.00 sec)
  ```

  

- Creating an index

  ```sql
  mysql> alter table classics add index(author(20));
  Query OK, 0 rows affected (0.03 sec)
  Records: 0  Duplicates: 0  Warnings: 0
  ```

- Add primary key

  ```sql
  ALTER TABLE classics ADD isbn CHAR(13);
  UPDATE classics SET isbn='9781598184891' WHERE year='1876';
  UPDATE classics SET isbn='9780582506206' WHERE year='1811';
  UPDATE classics SET isbn='9780517123201' WHERE year='1856';
  UPDATE classics SET isbn='9780099533474' WHERE year='1841';
  UPDATE classics SET isbn='9780192814968' WHERE year='1594';
  ALTER TABLE classics ADD PRIMARY KEY(isbn);
  DESCRIBE classics;
  
  mysql> DESCRIBE classics;
  +----------+--------------+------+-----+---------+-------+
  | Field    | Type         | Null | Key | Default | Extra |
  +----------+--------------+------+-----+---------+-------+
  | author   | varchar(128) | YES  | MUL | NULL    |       |
  | title    | varchar(128) | YES  | MUL | NULL    |       |
  | category | varchar(16)  | YES  | MUL | NULL    |       |
  | year     | smallint(6)  | YES  | MUL | NULL    |       |
  | isbn     | char(13)     | NO   | PRI | NULL    |       |
  +----------+--------------+------+-----+---------+-------+
  5 rows in set (0.01 sec)
  ```

  ## Querying a MySQL Database

  

- piping to `less`

  ```sql
  pager less;
  nopager;
  ```

- SELECT

  ```sql
  SELECT something FROM tablename;
  ```

  e.g.

  ```sql
  mysql> select author, title from classics;
  +---------------------+------------------------------+
  | author              | title                        |
  +---------------------+------------------------------+
  | Charles Dickens     | The Old Curiosity Shop       |
  | William Shakespeare | Romeo and Juliet             |
  | Charles Darwin      | The Origin of Species        |
  | Jane Austen         | Pride and Prejudice          |
  | Mark Twain          | The Adventures of Tom Sawyer |
  +---------------------+------------------------------+
  5 rows in set (0.00 sec)
  ```

- DELETE

  ```SQL
  DELETE FROM classics WHERE title='Little Dorrit';
  ```

- WHERE

  ```SQL
  mysql> select author, title from classics where author like "Charles%";
  +-----------------+------------------------+
  | author          | title                  |
  +-----------------+------------------------+
  | Charles Darwin  | The Origin of Species  |
  | Charles Dickens | The Old Curiosity Shop |
  +-----------------+------------------------+
  2 rows in set (0.00 sec)
  ```

  This qualifier should be used with a `%` character
  before or after some text. When placed before a keyword, `%` means anything before. After a keyword, it means anything after. 

- LIMIT

  ```SQL
  SELECT author,title FROM classics LIMIT 3;
  SELECT author,title FROM classics LIMIT 1,2;
  SELECT author,title FROM classics LIMIT 3,1;
  ```

  If you pass it two parameters, the first indicates the offset
  from the start of the results where MySQL should start the display, and the second indicates how many to return. 

- FULLTEXT

  ```SQL
  mysql> alter table classics add fulltext(author,title);
  Query OK, 0 rows affected, 1 warning (0.35 sec)
  Records: 0  Duplicates: 0  Warnings: 1
  ```

- MATCH ... AGAINST

  ```SQL
  mysql> select author, title from classics
      -> where match(author,  title) against('and');
  +---------------------+---------------------+
  | author              | title               |
  +---------------------+---------------------+
  | William Shakespeare | Romeo and Juliet    |
  | Jane Austen         | Pride and Prejudice |
  +---------------------+---------------------+
  2 rows in set (0.02 sec)
  ```

  - BOOLEAN MODE

    ```SQL
    mysql> select author,title from classics
        -> where match(author,title)
        -> against('+charles -species' in boolean mode);
    +-----------------+------------------------+
    | author          | title                  |
    +-----------------+------------------------+
    | Charles Dickens | The Old Curiosity Shop |
    +-----------------+------------------------+
    1 row in set (0.00 sec)
    ```

- UPDATE...SET

  ```SQL
  mysql> UPDATE classics set author='Mark Twain (Samuel Langhorne Clemens)'
      -> where author="Mark Twain";
  Query OK, 1 row affected (0.02 sec)
  Rows matched: 1  Changed: 1  Warnings: 0
  ```

- JOIN

  ```SQL
  CREATE TABLE customers (
  name VARCHAR(128),
  isbn VARCHAR(13),
  PRIMARY KEY (isbn)) ENGINE InnoDB;
  INSERT INTO customers(name,isbn)
  VALUES('Joe Bloggs','9780099533474');
  INSERT INTO customers(name,isbn)
  VALUES('Mary Smith','9780582506206');
  INSERT INTO customers(name,isbn)
  VALUES('Jack Wilson','9780517123201');
  SELECT * FROM customers;
  ```

  ```sql
  mysql> select name,author,title from customers,classics where customers.isbn=classics.isbn;
  +-------------+-----------------+------------------------+
  | name        | author          | title                  |
  +-------------+-----------------+------------------------+
  | Joe Bloggs  | Charles Dickens | The Old Curiosity Shop |
  | Jack Wilson | Charles Darwin  | The Origin of Species  |
  | Mary Smith  | Jane Austen     | Pride and Prejudice    |
  +-------------+-----------------+------------------------+
  3 rows in set (0.01 sec)
  
  mysql> select name,author,title from customers natural join classics;
  +-------------+-----------------+------------------------+
  | name        | author          | title                  |
  +-------------+-----------------+------------------------+
  | Joe Bloggs  | Charles Dickens | The Old Curiosity Shop |
  | Jack Wilson | Charles Darwin  | The Origin of Species  |
  | Mary Smith  | Jane Austen     | Pride and Prejudice    |
  +-------------+-----------------+------------------------+
  3 rows in set (0.00 sec)
  
  mysql> select name,author,title from customers join classics
      -> on customers.isbn=classics.isbn;
  +-------------+-----------------+------------------------+
  | name        | author          | title                  |
  +-------------+-----------------+------------------------+
  | Joe Bloggs  | Charles Dickens | The Old Curiosity Shop |
  | Jack Wilson | Charles Darwin  | The Origin of Species  |
  | Mary Smith  | Jane Austen     | Pride and Prejudice    |
  +-------------+-----------------+------------------------+
  3 rows in set (0.01 sec)
  
  
  mysql> select name,author,title from customers as cust, classics as class
      -> where cust.isbn=class.isbn;
  +-------------+-----------------+------------------------+
  | name        | author          | title                  |
  +-------------+-----------------+------------------------+
  | Joe Bloggs  | Charles Dickens | The Old Curiosity Shop |
  | Jack Wilson | Charles Darwin  | The Origin of Species  |
  | Mary Smith  | Jane Austen     | Pride and Prejudice    |
  +-------------+-----------------+------------------------+
  3 rows in set (0.00 sec)
  
  
  ```


