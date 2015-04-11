Multivariate Stats III
========================================================
incremental:true

Non-Metric Multidimensional Scaling
==============

## designed to create a diagram of relationships between objects
## based on the distance matrix

Non-Metric Multidimensional Scaling
==============

## Steps in the analysis

*  generate a distance matrix (often euclidian) $D$.  Each element $D_{ij}$ is the euclidian distance between the $ith$ and $jth$ observation.
*  choose the number of dimensions $n$ to use
*  start by placing the $m$ observations in an initial configuration in $n$ dimensional space
*  compute new distances: $\delta_{ij}$ for the points in the initial configuration
*  do a regression of $\delta_{ij}$ on $d_{ij}$, and use this regression to produce a set of expected distance values $\hat{\delta}_{ij}$

Non-Metric Multidimensional Scaling
==============

## Steps in the analysis

*  compute a goodness of fit between $\delta_{ij}$ and $\hat{\delta}_{ij}$.  This is the current **stress** of the configuration $$ Stress = \sqrt{\frac{\sum\limits_{i=1}^m\sum\limits_{j=1}^n(\delta_{ij}-\hat{\delta}_{ij})^2}{\sum\limits_{i=1}^m\sum\limits_{j=1}^n\hat{\delta}_{ij}}}$$
*  note that stress looks an awful lot like the chi-square statistic
*  change the position of the observations a little to reduce the stress, and rinse and repeat until the stress cannot be reduced any more
