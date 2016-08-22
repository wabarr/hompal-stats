---
output: html_document
---

# A couple of R exercises to keep your skills sharp.

***This is not meant to serve as a comprehensive exam review or practice test.***



## Part I

We will use a dataset of 31 modern localities in Africa.  The columns represent precipitation, vegetation type, number of large mammal species, as well as the percentages of those species belonging to different ecological categories (Arboreal, Aquatic, etc.). This is from a paper by Kaye Reed (1997, JHE).

*  Read the dataset into R. http://hompal-stats.wabarr.com/datasets/Reed1997_modern_adaptations.csv
*  calculate the mean rainfall values for sites classified as different habitats (Bushland, Woodland, etc...all the different levels of the `Simplified.Habitat` variable). You can do this in a single line of code. 
*  make a boxplot with the percentage of arboreal species (`Arboreality`) on the y-axis and the `Simplified.Habitat` variable on the x-axis.  The boxes should be color coded so the different habitats look distinct. 
*  make a scatter plot of the percentage of arboreal mammals versus the percentage of frugivorous species (`Frugivory`) for each site. Color code the points based on the `Rainfall` values for each site. 

## Part II

Imagine that I flipped a coin 4 times, and got heads every time.  Should I assume that this is a fair coin (probability of heads and tails are each 0.5) based on this data?  Write a Monte Carlo analysis to decide how extreme the 4 heads in-a-row result is, assuming this is a fair coin.

*  simulate a single trial of 4 flips using the binomial distribution, like this `rbinom(n=4, size=1, prob=0.5)`. We are assuming that the coin is fair, so the probability of a given outcome is 0.5.
*  test if the outcome of our single trial is 4 heads in a row (represented by `1 1 1 1`), and save the results of this test.  
*  repeat the trial 5,000 times, saving your result each time 
*  calculate the proportion of trials in which you got 4 heads in a row
*  Make your conclusion: if I got 4 heads in a row with a real coin, should I assume it is a fair coin? How did you make your decision?

