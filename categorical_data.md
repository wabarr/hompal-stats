========================================================
incremental: true

![categories](categorical-data.jpg)

Categorical Data
===============

Data that falls into a discrete number of categories. 

The different possible values of a categorical variable are called **levels**


```r
bird_sightings <- 
  factor(c("pigeon", "pigeon", "goshawk", 
           "eagle", "goshawk"))
levels(bird_sightings)
```

```
[1] "eagle"   "goshawk" "pigeon" 
```

Example - Species Occurrences
================


```r
myData <- data.frame(
  site = sample(c("site1","site2"), 1000, replace=T),
  species = sample(c("species1","species2", "species3"),1000, replace=T)
  )
head(myData)
```

```
   site  species
1 site2 species2
2 site2 species1
3 site1 species1
4 site2 species3
5 site1 species3
6 site2 species2
```

Example - Species Occurrences
==============

R has useful tools for counting occurrences


```r
table(myData$site,myData$species)
```

```
       
        species1 species2 species3
  site1      156      169      161
  site2      156      173      185
```

This is called a **contingency table**. Analysis of categorical data always operates on contingency tables.

Contingency Tables
================

A more real (but still fake) example.

Site | *A. afarensis* | *Ar. ramidus* |  *Aepyceros melampus*
---|----|-----|-------
Hadar | 120 | 0 | 600
Aramis | 0 | 90 | 220

Made up of counts or **frequencies** of observations in each category.

Rows are indexed by $i$ and columns are indexed by $j$.

There are $n$ rows in a table and $m$ columns.

Analyzing contingency tables requires the raw counts: not percentages, proportions, etc.

Hypothesis Testing
================
  
Site | *A. afarensis* | *Ar. ramidus* |  *Aepyceros melampus*
---|----|-----|-------
Hadar | 120 | 0 | 600
Aramis | 0 | 90 | 220


**Null hypothesis**: no association between $site$ variable and the $species$ variable.

**Alternative hypothesis**: There is a relationship between the $site$ variable and the $species$ variable

To reject the null hypothesis, we need to ask, what are the **expected values** of the cells, assuming no association?

Hypothesis Testing - Expected Values
================

Intuitively, what would you expect the value of each cell to be assuming the row and column variable are unrelated???

Site | *A. afarensis* | *Ar. ramidus* |  *Aepyceros melampus* 
---|----|-----|-------
Hadar | 120 | 0 | 600
Aramis | 0 | 90 | 220 

Going back to probability, the probability of being an *A. afarensis* at Hadar is a **shared event** made up of two **simple events**:

*  being *A. afarensis*
*  being at Hadar

We simply multiply these probabilities.

Hypothesis Testing - Expected Values
================
Site | *A. afarensis* | *Ar. ramidus* |  *Aepyceros melampus* 
---|----|-----|-------
Hadar | 120 | 0 | 600
Aramis | 0 | 90 | 220 

Shortcut for computing expected cell frequencies:

$$\hat{Y}_{i,j} = \frac{{row\ total}\times{column\ total}}{sample\ size} = \frac{\sum\limits_{j=1}^mY_{i,j}\times\sum\limits_{i=1}^nY_{i,j}}{N}$$

**Volunteer:** calculate by hand on board!

Hypothesis Testing - Chi-Square
===========

$$X^2_{Pearson} = \sum\limits_{all\ cells}\frac{(Observed-Expected)^2}{Expected}$$

Hypothesis Testing - Chi-Square
=============
left:65

![plot of chunk unnamed-chunk-4](categorical_data-figure/unnamed-chunk-4-1.png) 

***

Chi-square has a known distribution

Can be used to calculate p-values

Chi-square in R
=========


```r
myTable <- table(myData$site,myData$species)
chisq.test(myTable)
```

```

	Pearson's Chi-squared test

data:  myTable
X-squared = 0.9283, df = 2, p-value = 0.6287
```


Fisher's Exact Test
=============

More appropriate when sample sizes are low.

General rule is to use Fischer's if expected value for any cell is < 5.


```r
fisher.test(myTable)
```

```

	Fisher's Exact Test for Count Data

data:  myTable
p-value = 0.6312
alternative hypothesis: two.sided
```
