---
title: CHAPTER 12 Cookies, Sessions, and Authentication
author: chencanyi
title: 2019-08-15
tags: 
	- cookies
	- php
typora-root-url: /
---

Even if you aren’t offering logins and passwords, you will still often need to store details about a user’s current session and possibly also recognize them when they return to your site. 

## Cookies

A cookie is an item of data that a web server saves to your computer hard disk via your web browser.

### Creating a Cookie

```php
setcookie(name, value, expire, path, domain, secure, httponly);
setcookie('location', 'USA', time()+60*60*24*7, '/');
```

![1565843764455](/images/CHAPTER-12-Cookies,-Sessions,-and-Authentication.assets/1565843764455.png)

### Accessing a Cookie

```php
if(isset($_COOKIE['location'])) $location = $_COOKIE['location'];
```

### Destroying a Cookie

It is important for all parameters in your new `setcookie` call except the timestamp to be identical to the parameters when the cookie was first issued; otherwise, the deletion will fail. 

```php
setcookie('location', 'USA', time()-2592000, '/');
```



### Using password_hash

```php
echo password_hash("mypassword", PASSWORD_DEFAULT);
```



### Example

```php
<?php
require_once "login.php";
$conn = new mysqli($hn,$un,$pw,$db);
if($conn->connect_error) die("Fatal Error");
/*
$query = "CREATE TABLE users (
forename VARCHAR(32) NOT NULL,
surname VARCHAR(32) NOT NULL,
username VARCHAR(32) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL
)";

$result = $conn->query($query);
if (!$result) die("Fatal Error");
*/
$forename = 'Bill';
$surname = 'Smith';
$username = 'bsmith';
$password = 'mysecret';
$hash = password_hash($password,PASSWORD_DEFAULT);
add_user($conn,$forename,$surname,$username,$hash);

$forename = 'Pauline';
$surname = 'Jones';
$username = 'pjones';
$password = 'acrobat';
$hash = password_hash($password, PASSWORD_DEFAULT);
add_user($conn, $forename, $surname, $username, $hash);

function add_user($conn,$fn,$sn,$un,$pw){
    $stmt=$conn->prepare('INSERT INTO users VALUES(?,?,?,?)');
    $stmt->bind_param('ssss',$fn,$sn,$un,$pw);
    $stmt->execute();
    $stmt->close();
}
```



