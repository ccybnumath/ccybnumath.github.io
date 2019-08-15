---
title: Chapter 11. Form Handling
author: chencanyi
typora-root-url: /
---

## Input Types

### Text boxes

```php+HTML
<input type="text" name="name" size="size" maxlength="length" value="value">
```

### Text areas

```php+HTML
<textarea name='name' cols='width' rows='height' wrap='type'>
	This is some default text.
</textarea>
```

Both use the character spacing of the current font to determine the size of the area.  

![1565686720738](/images/Chapter-11.-Form-Handling.assets/1565686720738.png)

### Checkboxes

```php+HTML
<input type='checkbox' name='name' value='value' checked='checked'>
```



The string you assign to the attribute should be either a pair of double or single quotes or the value "checked", or there should be no value assigned (just checked).  

e.g.

```php+HTML
I Agree <input type="checkbox" name="agree" value="1">
```

```php+HTML
Vanilla <input type='checkbox' name='ice' value='Vanilla'>
Chocolate <input type='checkbox' name='ice' value='Chocolate'>
```

```php+HTML
Vanilla <input type='checkbox' name='ice[]' value='Vanilla'>
Chocolate <input type='checkbox' name='ice[]' value='Chocolate'>
```

```php
foreach($ice as $item) echo "$item<br>";
```

### Radio

```php+HTML
8am-Noon<input type='radio' name='time' value='1'>
    Noon-4pm<input type='radio' name='time' value='2' checked='checked'>
4pm-8pm<input type='radio' name='time' value='3'>
```

###  Hidden fields

```php+HTML
echo '<input type='hidden' name='submitted' value='yes'>'
```

### Select

```php+HTML
Vegetables
<select name="veg" size="1">
<option value="Peas">Peas</option>
<option value="Beans">Beans</option>
<option value="Carrots">Carrots</option>
<option value="Cabbage">Cabbage</option>
<option value="Broccoli">Broccoli</option>
</select>
```

### Labels

```php+HTML
<label>8am-Noon<input type='radio' name='time' value='1'></label>
```

### Submit

```html
<input type='image' name='submit' src='image.gif'>
<input type='submit' name='submit' value='Search'>
```

## Sanitizing input

```php
<?php
    function sanitizeString($var)
{
    if(get_magic_quotes_gpc())
        $var = stripslashes($var);
    $var = strip_tags($var);
    $var = htmlentities($var);
    return $var;
}

function sanitizeMySQL($conn, $var)
{
    $var = $conn->real_escape_string($var);
    $var = sanitizeString($var);
    return $var;
}
?>
```

### Autocomplete

```html
<form action='myform.php' method='post' autocomplete='on'>
    <input type='text' name='username'>
    <input type='password' name='password' autocomplete='off'>
</form>
```

### Autofocus

```html
<input type='text' name='query' autofocus='autofocus'>
```

### Placeholder

```html
<input type='text' name='name' size='50' placeholder='First & Last name'>
```

### Required

```html
<input type='text' name='creditcard' required='required'>
```

### Override 

```html
<form action='url1.php' method='post'>
<input type='text' name='field'>
<input type='submit' formaction='url2.php'>
</form>
```

### Width & height

```html
<input type='image' src='picture.png' width='120' height='60'>
```

### Min & max

```html
<input type='time' name='meeting' value='12:00'
min='09:00' max='16:00' step='3600'>
```

### The form Attribute

```html
<form action='myscript.php' method='post' id='form1'>
</form>
<input type='text' name='username' form='form1'>
```

### List

```html
Select destination:
<input type='url' name='site' list='links'>
<datalist id='links'>
<option label='Google' value='http://google.com'>
<option label='Yahoo!' value='http://yahoo.com'>
<option label='Bing' value='http://bing.com'>
<option label='Ask' value='http://ask.com'>
</datalist>
```

### Color

```html
Choose a color <input type='color' name='color'>
```

### Number & range

```html
<input type='number' name='age'>
<input type='range' name='num' min='0' max='100' value='50' step='1'>
```

### Date and Time Pickers

```html
<input type='time' name='time' value='12:34'>
```

