Comparative Methods
========================================================
incremental:true

![darwin_tree.jpg](darwin_tree.jpg)

Anatomy of a phylogenetic tree
================

![plot of chunk unnamed-chunk-1](comparative_methods-figure/unnamed-chunk-1-1.png) 

***

***nodes*** are the blue circles

***tips*** are the brown squares

***edges*** connect nodes (and tips)

edges have a length (known as a ***branch length***)

trees are ***hierarchical***, the pattern of branching is the ***topology***, and the deepest node is the ***root node***

Same topology, different representation
=====================

![plot of chunk unnamed-chunk-2](comparative_methods-figure/unnamed-chunk-2-1.png) 

***

The topology represents a series of hierarchical branching events

These trees have identical topologies.

***The differences between these trees are purely aesthetic***

Same topology, different representation
========================
incremental:false

![plot of chunk unnamed-chunk-3](comparative_methods-figure/unnamed-chunk-3-1.png) 

***

![plot of chunk unnamed-chunk-4](comparative_methods-figure/unnamed-chunk-4-1.png) 

========================

# Question

## What is the #1 assumption we have made in parametric stats throughout the semester?
   
# Answer

## Each observation is independent, and therefore residuals are independent and (hopefully) normally distributed

The Problem - Graphically
===============
incremental:false

### statistics assumes

![plot of chunk unnamed-chunk-5](comparative_methods-figure/unnamed-chunk-5-1.png) 

***

### evolution provides

![plot of chunk unnamed-chunk-6](comparative_methods-figure/unnamed-chunk-6-1.png) 



The Problem - Graphically
==========
left:60

![plot of chunk unnamed-chunk-7](comparative_methods-figure/unnamed-chunk-7-1.png) 

***

### Regression assumes that residuals are independent

### However, sometimes we can predict the sign ($\pm$) by knowing the phylogeny

### This is called ***phylogenetic autocorrelation*** and causes problems

The Problem is Insidious
===================
left:40

![plot of chunk unnamed-chunk-8](comparative_methods-figure/unnamed-chunk-8-1.png) 

***

### This example is extreme...some people call this a  ***grade shift***

### Folks have long been wary of grade shifts, and done seperate regressions for different groups

### But in absence of obvious grade shifts, phylogenetic autocorrelation of residuals still causes 2 problems:

*  increases variance of parameter estimates (e.g. slopes and intercepts)
*  increases Type I (false positive) error rate

Recall the General Linear Model 
=================

$$Y_i = \beta_0 + \beta_1X_i + \beta_2X_i +\ ... +\ \beta_nX_i  + \epsilon_i$$

### where: 

* $\beta_0$ is the y-intercept (value of y where x= 0)
*  $\beta_1X_i$ is the slope value for the 1st x variable
*  $\epsilon_i$ is the error term, distributed as a normal random variable

### The solution to the problem of phylogenetic autocorrelation comes when we relax our assumptions about the error term

Generalized Linear Model
=================

### Similar in structure to general linear models, but allows specification of the assumed residual error structure

### With biological data, a reasonable assumption is that residuals will be correlated with phylogenetic distance (sum of branch lengths along the phylogenetic tree)

Phylogenetic Generalized Linear Model
============

![plot of chunk unnamed-chunk-9](comparative_methods-figure/unnamed-chunk-9-1.png) 

*** 

Homo and chimp have much shorter branches connecting them than chimp and gorilla

We can represent all these distances by making a phylogenetic ***variance/covariance matrix***

We use this phyloVCV matrix in pGLM, instead of a normal error term

Often called PGLS, but pGLM is more general term

Quantifying Phylogenetic Signal
==============

### Residual autocorrelation in proportion to the VCV is a reasonable starting assumption, but we don't want to always assume this

### Better to estimate how much phylogenetic signal exists

### $\lambda$ does this

### varies between 0 and 1, and scales the branch lengths of the tree (and thus the VCV matrix)

lambda - branch length transformations
===============
incremental:false

![plot of chunk unnamed-chunk-10](comparative_methods-figure/unnamed-chunk-10-1.png) 
*** 
![plot of chunk unnamed-chunk-11](comparative_methods-figure/unnamed-chunk-11-1.png) 

Estimating lambda
=============

### when doing PGLS, you can estimate the most appropriate value of lambda for your data

### if $\lambda = 0$ then PGLS is equivalent to general linear model

### if $\lambda = 1$ then PGLS is equivalent to phylogenetically independent contrasts

### we also have to assume a model of evolution.  Usually Brownian motion.

PGLS in R
=============

### `caper` package is most user friendly
