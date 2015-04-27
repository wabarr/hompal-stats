Linear Mixed Models
========================================================
incremental: true

![mixed](mixed-model.jpg)

Categorical Explanatory Variables
=====================

So far in [ANOVA](anova.html) we have treated all categorical vars as the same

There are actually two types of categorical variables
 
*  ***fixed effects***
*  ***random effects***

## It can be tricky at first to tell them apart

Telling them apart
==================

ANOVA model: $$Y_{ij}=\mu + A_i + \epsilon_{ij}$$

**Fixed effects** ($A_i$) affect the mean of groups in a meaningful way

Mixed Model: $$Y_{ij}=\mu + A_i + U_i + \epsilon_{ij}$$

**Random effects** ($U_i$) further break down the error term, structuring variance, but not in an additive way like fixed effects


Telling them apart
=============

**Fixed Effects**:

*  meaningful factor labels (e.g., male); small possible set
*  affect only mean of $y$ variable
*  effect predictable in different studies (e.g., sex in monkey morphometrics)

**Random Effects**:

*  uninformative factor labels (e.g., site A); very large possible set
*  affect only the variance of $y$ variable
*  effect unpredictable or meaningless across studies

Telling them apart - Example
=============
incremental: false

**Question: do dyadic aggression rates differ by sex?**

You follow a group of habituated monkeys for 2 months. Each day you watch each monkey for an hour, and record the number of agonistic encounters, and the time of day the observation was made.  In the end you have 600 observations (10 monkeys $\times$ 60 days).


MonkeyID | Sex | AggEncounters | ObservationTime
---|----|----|----
Bob | male | 4 | morning
Cindy | female | 3 | morning
Bob | male | 7 | evening
Cindy | female | 2 | evening
... | ... | ... | ...

Telling them apart - Example
=============

MonkeyID | Sex | AggEncounters | ObservationTime
---|----|----|----
Bob | male | 4 | morning
Cindy | female | 3 | morning
Bob | male | 7 | evening
Cindy | female | 2 | evening
... | ... | ... | ...

You have a single response variable: **AggEncounters**

Three predictor variables: **Sex**, **MonkeyID**, **ObservationTime**

**Question: do dyadic aggression rates differ by sex?**

Which are fixed and which are random effects?

Two main circumstances where LMM is first choice
================

*  none of your effects are fixed (less common)
*  you have one or more fixed effects, but also have ***pseudo-replication*** (more common)

Pseudo-replication
==================

Recall from our discussion of ANOVA that independent observations in a treatment group are called ***replicates***

Example: in a study of tooth crown dimensions in hunter-gatherers versus industrialized populations, each measured tooth is a replicate of the population treatment. 

***Pseudoreplication*** occurs when what appear to be a replicate of the treatment group actually isn't independent.  

This situation is common, and is easy to identify with a bit of practice. 

Pseudo-replication
==================

MonkeyID | Sex | AggEncounters | ObservationTime
---|----|----|----
Bob | male | 4 | morning
Cindy | female | 3 | morning
Bob | male | 7 | evening
Cindy | female | 2 | evening
... | ... | ... | ...

Recall our dataset of 600 observations of sex and aggressive encounter rate, measured daily for 2 months (60 days) for 10 individuals.  

**This dataset is massively pseudo-replicated.....why?**

LMM in R
====================

`lme4` package




```
Error in library(lme4) : there is no package called 'lme4'
```
