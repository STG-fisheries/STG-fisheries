## ------ Title:    Experimental Power Analysis in R ------ ## 
## ------ Editor:   Spencer T. Gardner ------ ##
## ------ Date:     6/23/2021 ------ ##

# Type I Error (alpha) = Probability of incorrectly rejecting a true null hypothesis 
#       - This is a FALSE POSITIVE, concluding there's a pattern when one doesn't exist
#       - alpha is the acceptable significance level (usually set to 0.05 or 5%)

# Type II Error (beta) = Probability of failing to reject a false null hypothesis (false negative)
#       - This is a FALSE NEGATIVE, concluding there's no pattern when one actually exist
#       - (1 - beta) is the statistical power... 

# What determines statistical power?
#         - Size of the effect
#         - Variabiltiy in the effect (sd)
#         - Sample size (n) ... number of observable replicates

# There is a TRADE-OFF between Type I and Type II errors. Decreasing the probability of one, increases probability of the other. 

#   Before conducting an experiment we should always determine how likely we are 
# to detect an effect given our experimental design (i.e., replicates, treatment
# levels, etc.). 

#______________________________________________________________________________________________________________________________

rm(list = ls(all.names = TRUE))              # Delete all objects in R

getwd()
setwd()

## Install necessary packages for analysis
install.packages(c("tidyverse", "lme4", "sjPlot", "simr"))

library(tidyverse)                            # collection of open sourced packages used to structure and summarize data 
library(lme4)                                 # linear and generalized mixed-effects models 
library(sjPlot)                               # visualization package
library(simr)                                 # calculates power for generalized linear mixed-effects models... designed to work with lme4
