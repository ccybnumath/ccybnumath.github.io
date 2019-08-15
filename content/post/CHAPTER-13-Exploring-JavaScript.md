---
title: CHAPTER 13 Exploring JavaScript
author: chencanyi
title: 2019-08-15
tags: 
	- javascript
typora-root-url: /
---

However, the naming was just a marketing ploy to help the new scripting language benefit from the popularity of the Java programming language. 




## JavaScript Basics

### helloWorld.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello World!</title>

</head>
<body>
<script type="text/javascript">
    document.write("Hello World!")
</script>
<noscript>
    Your browser doesn't support or has disabled JavaScript
</noscript>
</body>
</html>
```

### Debugging JavaScript Errors 

![1565875302013](/images/CHAPTER-13-Exploring-JavaScript.assets/1565875302013.png)

### Using Comments

```html
<script type='text/javascript'>
// This is a comment
/* This is a section 
	of multiline comments
	that will not be interpreted*/
</script>
```

### Variables 

![1565875599661](/images/CHAPTER-13-Exploring-JavaScript.assets/1565875599661.png)

![1565875613092](/images/CHAPTER-13-Exploring-JavaScript.assets/1565875613092.png)

```javascript
//String variables
greeting = "\"Hello there\" is a greeting"
warning = '\'Be careful\' is a warning'
//Numeric variables
cout = 42
temperature = 98.2
//Arrays
toys=['bat','ball','whistle','puzzle','doll']
face = 
[
    ['R','G','Y'],
    ['W','R','O']
]

top = ['R', 'G', 'Y']
mid = ['W', 'R', 'O']
bot = ['Y', 'W', 'G']
face = [top, mid, bot]
document.write(face[1][1])
```

### Operators

* Arithmetic

![1565875990705](/images/CHAPTER-13-Exploring-JavaScript.assets/1565875990705.png)

* Assignment

  ```javascript
  count +=1
  ```

  ![1565876163562](/images/CHAPTER-13-Exploring-JavaScript.assets/1565876163562.png)

  ![1565876191305](/images/CHAPTER-13-Exploring-JavaScript.assets/1565876191305.png)

  ![1565876215562](/images/CHAPTER-13-Exploring-JavaScript.assets/1565876215562.png)

* String Concatenation

  ```javascript
  document.write("You have" + messages + "messages.")
  ```

  

![1565876296516](/images/CHAPTER-13-Exploring-JavaScript.assets/1565876296516.png)

### Typeof

```html
<script>
n = '838102050' // Set 'n' to a string
document.write('n = ' + n + ', and is a ' + typeof n + '<br>')
n = 12345 * 67890; // Set 'n' to a number
document.write('n = ' + n + ', and is a ' + typeof n + '<br>')
n += ' plus some text' // Change 'n' from a number to a string
document.write('n = ' + n + ', and is a ' + typeof n + '<br>')
</script>
```

### Functions

```javascript
function  product(a,b){
    return a*b
}
```

### Scope

* Local Variables

  To define a local variable that has scope only within the current function, and has not been passed as a parameter, use the `var` keyword. 

## Document Object Model (DOM)

![1565876793719](/images/CHAPTER-13-Exploring-JavaScript.assets/1565876793719.png)

```html
<html>
<head>
<title>Link Test</title>
</head>
<body>
<a id="mylink" href="http://mysite.com">Click me</a><br>
<script>
url = document.links.mylink.href
document.write('The URL is ' + url)
</script>
</body>
</html>
```

