String Formatting
========================================================
incremental:true

stringr
===========

## A part of the Hadleyverse that makes it much easier to do string manipulation in R. 


```r
library(stringr)
fruit <- c("apple", "banana", "pear", "pineapple", "banana")
```

str_detect()
============


```r
fruit
```

```
[1] "apple"     "banana"    "pear"      "pineapple" "banana"   
```

```r
str_detect(fruit, "b")
```

```
[1] FALSE  TRUE FALSE FALSE  TRUE
```

```r
str_detect(fruit, "apple")
```

```
[1]  TRUE FALSE FALSE  TRUE FALSE
```

str_extract()
=============


```r
str_extract(fruit, "p")
```

```
[1] "p" NA  "p" "p" NA 
```

```r
str_extract_all(fruit, "p")
```

```
[[1]]
[1] "p" "p"

[[2]]
character(0)

[[3]]
[1] "p"

[[4]]
[1] "p" "p" "p"

[[5]]
character(0)
```

str_replace()
============


```r
str_replace(fruit, "[aeiou]", "-")
```

```
[1] "-pple"     "b-nana"    "p-ar"      "p-neapple" "b-nana"   
```

```r
str_replace_all(fruit, "[aeiou]", "-")
```

```
[1] "-ppl-"     "b-n-n-"    "p--r"      "p-n--ppl-" "b-n-n-"   
```

str_split()
============


```r
fossils <- c("KNM-ER-1470", "KNM-ER-1813", "KNM-WT-15000")
str_split(fossils, "-")
```

```
[[1]]
[1] "KNM"  "ER"   "1470"

[[2]]
[1] "KNM"  "ER"   "1813"

[[3]]
[1] "KNM"   "WT"    "15000"
```

paste() and paste0()
==============

## part of base R


```r
names<-c("Andrew", "William", "Mud")
paste("My name is", names)
```

```
[1] "My name is Andrew"  "My name is William" "My name is Mud"    
```

```r
paste0("2+2=", 2+2) #no space
```

```
[1] "2+2=4"
```

sprintf()
============

## More complicated but more powerful string formatting

## Requires specification of wildcard placeholder characters:

*  %s = a character string
*  %d = an integer value
*  %f = a fixed point number (number with a decimal point)


```r
sprintf("All your %s are belong to %s", "Base", "Us")
```

```
[1] "All your Base are belong to Us"
```


sprintf()
============


```r
sprintf("%d calling birds, %d french hens, %d turtle doves", 2+2, 5-2, 2)
```

```
[1] "4 calling birds, 3 french hens, 2 turtle doves"
```

```r
sprintf("I like to eat %f", pi)
```

```
[1] "I like to eat 3.141593"
```

Regular Expressions
==============
type:section

## Matching patterns in text strings

## Not just useful for R, useful for find and replace in text editors, etc. 

Regular Expressions
==============


```r
shopping_list <- c("apples x4", "flour", "sugar", "milk x2")
```

*  \\d matches any single numeric digit


```r
str_extract(shopping_list, "\\d")
```

```
[1] "4" NA  NA  "2"
```

Regular Expressions
==============

*  use brackets to define sets of characters to match
*  the + symbol indicates any number of repetitions of the matched sequence


```r
str_extract(shopping_list, "[a-z]+")
```

```
[1] "apples" "flour"  "sugar"  "milk"  
```

Regular Expressions
==============

* the ^ and $ characters denote the beginning and end of the string, respectively


```r
shopping_list
```

```
[1] "apples x4" "flour"     "sugar"     "milk x2"  
```

```r
str_extract(shopping_list, "^a")
```

```
[1] "a" NA  NA  NA 
```

Regular Expressions
==============

* the ^ and $ characters denote the beginning and end of the string, respectively


```r
shopping_list
```

```
[1] "apples x4" "flour"     "sugar"     "milk x2"  
```

```r
str_extract(shopping_list, "x\\d$")
```

```
[1] "x4" NA   NA   "x2"
```

Interacting with the File System
==================
type:section

Setting the Working Directory
==================

```r
getwd()
```

```
[1] "/Users/andrewbarr/Dropbox/ANTH 6413 - Stats/HomPal-Stats-Website"
```

```r
dir.create("~/Desktop/exampledir/")
setwd("~/Desktop/exampledir/")
```

Create Files
===============


```r
filez <- paste0("test",1:20,".txt")
file.create(filez)
```

```
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[15] TRUE TRUE TRUE TRUE TRUE TRUE
```

List Files
=================


```r
list.files(path = "~/Desktop/exampledir/")
```

```
character(0)
```

List Files
=================


```r
list.files(path = "~/Desktop/exampledir/", full.names = TRUE)
```

```
character(0)
```

Do something to a bunch of files
==================

```{}
myFiles <- list.files(path = "~/Desktop/exampledir/", full.names = TRUE)
```

```
lapply(myFiles, FUN=function(filename){
  read.table(filename)
  #do lots of useful things
})
```

Delete files
===========

## Be very careful doing this!  You don't want to delete files that you need!


```r
unlink("~/Desktop/exampledir/", recursive = TRUE)
```

