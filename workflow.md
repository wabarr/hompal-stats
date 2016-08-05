# publishing papers with R

The gold standard for reproducible research is to write your papers as R markdown documents, with embedded R code. All your figures, tables (with captions for both) are recreated everytime you knit the document, and reference lists are built automatically. 

## This gold standard is achievable using Rstudio

Even if you never write a paper directly in R markdown, there are a few tools that will make your use of Rmarkdown more productive

*   using appropriate section headings
*   using figure captions
*  `pander` for data frames, and for tabularizing model output (also table captions)
*  including citations in R markdown


## Section headings

Pay careful attention to the way you use headings in Rmarkdown.  

*  `#` is the first level heading - this is usually the document title
*  `##` is the second level heading - this might be the main sections of a paper: Introduction, Methods, Conclusion, etc.
*  `###` is the third level heading - for sub-sections within main parts of the document

### The key point is, think about the structure of the document, and use the headings consistently.  This makes is easier to change document formats (e.g. to PDF or to MS Word) and have the results make sense.

## Figure captions

When you create figures in RMarkdown, you can give them captions.  This is good practice:

\`\`\`{r, fig.cap="Histogram of normal distribution, n=1000"}<br>
library(ggplot2)</br>
qplot(rnorm(1000))</br>
\`\`\`


```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![Histogram of normal distribution, n=1000](workflow_files/figure-html/unnamed-chunk-1-1.png)

These captions aren't visible in the HTML output, but they are in there, and will be included when you covert the document to other formats

## pander - a useful tool for formatting tabular data in R Markdown

By default when you print a dataframe to a markdown documen, it doesn't look that great. 


```r
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```


Pander turns the dataframe into something much nicer!


```r
library(pander)
pander(mtcars, split.tables = 200)
```


---------------------------------------------------------------------------------------------
         &nbsp;            mpg   cyl   disp   hp   drat   wt    qsec   vs   am   gear   carb 
------------------------- ----- ----- ------ ---- ------ ----- ------ ---- ---- ------ ------
      **Mazda RX4**        21     6    160   110   3.9   2.62  16.46   0    1     4      4   

    **Mazda RX4 Wag**      21     6    160   110   3.9   2.875 17.02   0    1     4      4   

     **Datsun 710**       22.8    4    108    93   3.85  2.32  18.61   1    1     4      1   

   **Hornet 4 Drive**     21.4    6    258   110   3.08  3.215 19.44   1    0     3      1   

  **Hornet Sportabout**   18.7    8    360   175   3.15  3.44  17.02   0    0     3      2   

       **Valiant**        18.1    6    225   105   2.76  3.46  20.22   1    0     3      1   

     **Duster 360**       14.3    8    360   245   3.21  3.57  15.84   0    0     3      4   

      **Merc 240D**       24.4    4   146.7   62   3.69  3.19    20    1    0     4      2   

      **Merc 230**        22.8    4   140.8   95   3.92  3.15   22.9   1    0     4      2   

      **Merc 280**        19.2    6   167.6  123   3.92  3.44   18.3   1    0     4      4   

      **Merc 280C**       17.8    6   167.6  123   3.92  3.44   18.9   1    0     4      4   

     **Merc 450SE**       16.4    8   275.8  180   3.07  4.07   17.4   0    0     3      3   

     **Merc 450SL**       17.3    8   275.8  180   3.07  3.73   17.6   0    0     3      3   

     **Merc 450SLC**      15.2    8   275.8  180   3.07  3.78    18    0    0     3      3   

 **Cadillac Fleetwood**   10.4    8    472   205   2.93  5.25  17.98   0    0     3      4   

 **Lincoln Continental**  10.4    8    460   215    3    5.424 17.82   0    0     3      4   

  **Chrysler Imperial**   14.7    8    440   230   3.23  5.345 17.42   0    0     3      4   

      **Fiat 128**        32.4    4    78.7   66   4.08   2.2  19.47   1    1     4      1   

     **Honda Civic**      30.4    4    75.7   52   4.93  1.615 18.52   1    1     4      2   

   **Toyota Corolla**     33.9    4    71.1   65   4.22  1.835  19.9   1    1     4      1   

    **Toyota Corona**     21.5    4   120.1   97   3.7   2.465 20.01   1    0     3      1   

  **Dodge Challenger**    15.5    8    318   150   2.76  3.52  16.87   0    0     3      2   

     **AMC Javelin**      15.2    8    304   150   3.15  3.435  17.3   0    0     3      2   

     **Camaro Z28**       13.3    8    350   245   3.73  3.84  15.41   0    0     3      4   

  **Pontiac Firebird**    19.2    8    400   175   3.08  3.845 17.05   0    0     3      2   

      **Fiat X1-9**       27.3    4     79    66   4.08  1.935  18.9   1    1     4      1   

    **Porsche 914-2**      26     4   120.3   91   4.43  2.14   16.7   0    1     5      2   

    **Lotus Europa**      30.4    4    95.1  113   3.77  1.513  16.9   1    1     5      2   

   **Ford Pantera L**     15.8    8    351   264   4.22  3.17   14.5   0    1     5      4   

    **Ferrari Dino**      19.7    6    145   175   3.62  2.77   15.5   0    1     5      6   

    **Maserati Bora**      15     8    301   335   3.54  3.57   14.6   0    1     5      8   

     **Volvo 142E**       21.4    4    121   109   4.11  2.78   18.6   1    1     4      2   
---------------------------------------------------------------------------------------------

### It is smart enought to deal with many common output types

#### lm

```r
pander(lm(mpg~wt, data=mtcars))
```


--------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|) 
----------------- ---------- ------------ --------- ----------
     **wt**         -5.344      0.5591     -9.559   1.294e-10 

 **(Intercept)**    37.29       1.878       19.86   8.242e-19 
--------------------------------------------------------------

Table: Fitting linear model: mpg ~ wt


### chisq.test

```r
pander(chisq.test(mtcars$cyl))
```


-------------------------------
 Test statistic   df   P value 
---------------- ---- ---------
     15.98        31   0.9881  
-------------------------------

Table: Chi-squared test for given probabilities: `mtcars$cyl`

### anova

```r
pander(anova(lm(mpg~cyl, data=mtcars)))
```


-----------------------------------------------------------
    &nbsp;       Df   Sum Sq   Mean Sq   F value   Pr(>F)  
--------------- ---- -------- --------- --------- ---------
    **cyl**      1    817.7     817.7     79.56   6.113e-10

 **Residuals**   30   308.3     10.28      NA        NA    
-----------------------------------------------------------

Table: Analysis of Variance Table

### prcomp


```r
pander(summary(prcomp(mtcars)))
```


-----------------------------------------------------------------------------
  &nbsp;      PC1       PC2      PC3       PC4      PC5      PC6       PC7   
---------- --------- --------- -------- --------- -------- -------- ---------
 **mpg**   -0.03812  0.009185   0.9821   0.04763  -0.08833 -0.1438  -0.03924 

 **cyl**    0.01204  -0.003372 -0.06348  -0.228    0.2387  -0.7938    0.425  

 **disp**   0.8996    0.4354   0.03144  -0.005087 -0.01074 0.007424 0.0005824

  **hp**    0.4348    -0.8993  0.02509   0.03572  0.01655  0.001654 -0.002213

 **drat**  -0.00266   -0.0039  0.03972  -0.05713  -0.1333   0.2272   0.03485 

  **wt**   0.006239  0.004861  -0.08491   0.128   -0.2435  -0.1271   -0.1866 

 **qsec**  -0.006671  0.02501  -0.07167  0.8865   -0.2142  -0.1896   0.2548  

  **vs**   -0.002729 0.002198  0.004203  0.1771   -0.01689  0.1026  -0.08079 

  **am**   -0.001963 -0.005794 0.05481   -0.1357  -0.0627   0.2052   0.2009  

 **gear**  -0.002605 -0.01127  0.04852   -0.1299  -0.2762   0.335    0.8016  

 **carb**  0.005766  -0.02778  -0.1029   -0.2689  -0.8552  -0.2838   -0.1655 
-----------------------------------------------------------------------------

Table: Principal Components Analysis (continued below)

 
---------------------------------------------------
  &nbsp;      PC8        PC9      PC10      PC11   
---------- ---------- --------- --------- ---------
 **mpg**    0.02271   -0.00279   0.03063  -0.01586 

 **cyl**     -0.189    0.04268   0.1317    0.1454  

 **disp**  -0.0005841 0.003533  -0.005399 0.000942 

  **hp**   4.748e-06  -0.003734 0.001863  -0.002153

 **drat**   -0.9386   -0.01413   0.1841   -0.09738 

  **wt**     0.1562    -0.3906   0.8299   -0.01986 

 **qsec**   -0.1029   -0.09591   -0.2042   0.01107 

  **vs**   -0.002133    0.684    0.3031    0.6257  

  **am**    -0.02273   -0.5724   -0.1628   0.7332  

 **gear**    0.2175    0.1561    0.2035    -0.1909 

 **carb**   0.003972   0.1276     -0.24    0.0558  
---------------------------------------------------


------------------------------------------------------------------------------
           &nbsp;             PC1    PC2     PC3    PC4    PC5    PC6    PC7  
---------------------------- ----- ------- ------- ------ ------ ------ ------
   **Standard deviation**    136.5  38.15   3.071  1.307  0.9065 0.6635 0.3086

 **Proportion of Variance**  0.927 0.07237 0.00047 8e-05  4e-05  2e-05    0   

 **Cumulative Proportion**   0.927 0.9994  0.9998  0.9999   1      1      1   
------------------------------------------------------------------------------

Table: Table continues below

 
-------------------------------------------------------
           &nbsp;             PC8   PC9    PC10   PC11 
---------------------------- ----- ------ ------ ------
   **Standard deviation**    0.286 0.2507 0.2107 0.1984

 **Proportion of Variance**    0     0      0      0   

 **Cumulative Proportion**     1     1      1      1   
-------------------------------------------------------



## Including references in markdown documents

In the front-matter of the R markdown document (where you put your name and the date, etc), you can optionally include a bibliography file (containing a list of reference) and a csl document (a document specifying the style of references desired).  This is what the front-matter of the R markdown document used to create this document looks like: 

```{}
---
title: "publishing papers with R"
output: html_document
bibliography: bib.bib
csl: elsevier-harvard.csl
---
```

### bibliography file

R markdown can read many common reference formats (easily exported from Papers, Zotero, or Endnote), these include:

*  .bib (BibTeX)
*  .RIS (RIS)
*  .enl (Endnote)

A full list and more details [can be found here](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html). The file should live in the same directory as the Rmarkdown document

### csl file

This file indicates how the inline citations and the bibliography should be formatted.  You can browse many csl styles for specific journals [here](http://zotero.org/styles).  When you download the csl file, you should put it in the same directory as the RMarkdown file. 

### an example

You can see what my .bib file looks like [here](bib.bib).  Note that each reference is given a unique key in the format `lastName_firstWordOfTitle_Year`.  These keys are used to insert inline citations. Every reference cited will automagically be added to the bibliography, which will be placed at the end of the file. 

#### Here is an example of the raw text before processing:

```{}
Here is a nice paper about savannas [@skarpe_dynamics_1992].  There are a couple more articles also [@foley_integrated_1996; @eltahir_role_2004]. Finally, Belsky [-@belsky_tree/grass_1990] published an article about savannas, as well. 

## References
```
#### This is what the output looks like.

Here is a nice paper about savannas [@skarpe_dynamics_1992].  There are a couple more articles also [@foley_integrated_1996; @eltahir_role_2004]. Finally, Belsky [-@belsky_tree/grass_1990] published an article about savannas, as well. 

## References

 
