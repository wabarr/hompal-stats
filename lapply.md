notes on lapply()
========================================================

### Or 

## why did so many of you do the same weird thing on your homework?

lapply() basic usage
========================================================

## usage

`lapply(X,FUN)`

***
## arguments

`X` is a vector or list to loop over

`FUN` is the name a function to apply to each element of `X`

lapply() basic example 
========================================================


```r
fruits<-c("oranges", "bananas", "cherries")

iLike <- function(thingIlike) {
  paste("I like", thingIlike)
}

lapply(fruits, iLike)
```

```
[[1]]
[1] "I like oranges"

[[2]]
[1] "I like bananas"

[[3]]
[1] "I like cherries"
```

lapply() basic example explained
========================================================


```r
fruits<-c("oranges", "bananas", "cherries")

iLike <- function(thingIlike) {
  paste("I like", thingIlike)
}

lapply(fruits, iLike)
```

*  `fruits` is a simple vector with three elements
*  `iLike` is a function with single argument called `thingIlike`
    *  the `paste()` function is used to combine the text "I like" whatever value we assign to the `thingIlike` argument
*  we use `lapply` to loop over each element of `fruits` and apply the function to each in sequence

lapply() in the homework
========================================================
You were asked to use `lapply()` to loop over the `iris` dataframe and do a `shapiro.test` on each column.

***You almost all did this perfectly.***


```r
iris_results <- lapply(iris[-5], FUN=shapiro.test)

iris_results[[1]]
```

```

	Shapiro-Wilk normality test

data:  X[[1L]]
W = 0.9761, p-value = 0.01018
```

lapply() in the homework - the offender
========================================================
Next, you used `lapply()` `iris_results` to extract the p-values.  About half (or mor) of you gave me this code.


```r
lapply(iris_results, '[[', 2)
```

```
$Sepal.Length
[1] 0.01018116

$Sepal.Width
[1] 0.1011543

$Petal.Length
[1] 7.412263e-10

$Petal.Width
[1] 1.680465e-08
```

lapply() in the homework - the offender
========================================================
Some people also gave me this equivalent version


```r
lapply(iris_results, '[[', "p.value")
```

```
$Sepal.Length
[1] 0.01018116

$Sepal.Width
[1] 0.1011543

$Petal.Length
[1] 7.412263e-10

$Petal.Width
[1] 1.680465e-08
```

lapply() in the homework - a better way
========================================================
Writing a function to pull out p values is MUCH easier to read!


```r
get.p <- function(testresults) {
  testresults$p.value
}
lapply(iris_results, get.p)
```

```
$Sepal.Length
[1] 0.01018116

$Sepal.Width
[1] 0.1011543

$Petal.Length
[1] 7.412263e-10

$Petal.Width
[1] 1.680465e-08
```

lapply() in the homework  - my concern
========================================================
type:alert

many of you used the identical and very strange usage of '[[', which I didn't tell you about, and was very different from all the `lapply()` examples I have shown you.

## good news

somebody followed the JFGIS principle and found this way to get the pvalue!

## bad news

It seems clear that many of you uncritically got this usage from said googler, and didn't think about the much clearer way to do it -- one that was similar to other examples of `lapply()` I have given you--

going forward
========================================================
type:section
<br>
# Dont over-rely on help from classmates
### you are going to have to do this stuff alone on your exam!
