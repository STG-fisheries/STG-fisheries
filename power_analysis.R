## ------ Title:    Experimental Power Analysis in R ------ ## 
## ------ Editor:   Spencer T. Gardner ------ ##
## ------ Contributor:  Stephen W. Parker ------ ##
## ------ Date:     June 2021 ------ ##

## What sample size would be needed to detect a hypothesized effect based on some critical level of significance, alpha?

# Type I Error (alpha) = Probability of incorrectly rejecting a true null hypothesis 
#       - This is a FALSE POSITIVE, concluding there's a pattern when one doesn't exist
#       - alpha is the acceptable significance level (usually set to 0.05 or 5%)

# Type II Error (beta) = Probability of failing to reject a false null hypothesis (false negative)
#       - This is a FALSE NEGATIVE, concluding there's no pattern when one actually exist
#       - (1 - beta) is the statistical power... here we start with 0.80 (4:1 trade-off between Type II and Type I error) 

# What determines statistical power?
#         - Size of the effect
#         - Variabiltiy in the effect (sd)
#         - Sample size (n) ... number of observable replicates

# There is a TRADE-OFF between Type I and Type II errors. Decreasing the probability of one, increases probability of the other. 

# Before conducting an experiment we should always determine how likely we are to detect an effect given our experimental design 
# (i.e., A Priori power analysis). However, we can also interpret an analysis that has failed to reject the null hypothesis 
# through an A Posteriori power analysis.

#______________________________________________________________________________________________________________________________

rm(list = ls(all.names = TRUE))              # Delete all objects in R

getwd()
setwd()

## ------ Code Source: https://slcladal.github.io/pwr.html#Preparation_and_session_set_up
## Install necessary packages for analysis
install.packages(c("tidyverse", "lme4", "sjPlot", "simr")) 

library(tidyverse)                            # collection of open sourced packages used to structure and summarize data 
library(lme4)                                 # linear and generalized mixed-effects models 
library(sjPlot)                               # visualization package
library(simr)                                 # calculates power for generalized linear mixed-effects models... designed to work with lme4

# Generate the following dataset
##=============================
# 45 total observations
# 2 Factors (Temperature and Photoperiod)
# 3 Treatment Levels

sim_data <- data.frame(
  unique_id <- rep(1:45),
  tank_no <- rep(paste0("Tank_" 1:9), each = 3),
  treatment <- rep(c(
    rep("PL:TL", 3),
    rep("PL:TM", 3),
    rep("PL:TH", 3),
    rep("PM:TL", 3),
    rep("PM:TM", 3),
    rep("PM:TH", 3),
    rep("PH:TL", 3),
    rep("PH:TM", 3),
    rep("PH:TH", 3))),
) %>%
  dplyr::mutate_if(is.character, factor)
