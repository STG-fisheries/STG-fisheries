## ------ Title:    Experimental Power Analysis in R ------ ## 
## ------ Editor:   Spencer T. Gardner ------ ##
## ------ Contributor:  Frederick S. Scharf & Stephen W. Parker ------ ##
## ------ Date:     June 2021 ------ ##

## What sample size would be needed to detect a hypothesized effect based on some critical level of significance, alpha?

# Type I Error (alpha) = Probability of rejecting (incorrectly) the null hypothesis when it is in fact true.
#       - This is a FALSE POSITIVE, you are concluding that a false pattern exist.
#       - alpha is the acceptable significance level (usually set to 0.05 or 5%).

# Type II Error (beta) = Probability of failing to reject the null hypothesis when it is in fact false.
#       - This is a FALSE NEGATIVE, here the error occurs when concluding there's no pattern when one actually exist.
#       - (1 - beta) is the statistical power... here we start with 0.80 (4:1 trade-off between Type II and Type I error).
#                                               * If we were as conservative about Type II as Type I we would set power to 0.95

# What determines statistical power?
#         - Size of the effect (ecological relevant difference between populations)
#         - Variabiltiy in the effect (s^2) --> natural and measured variance
#         - Sample size (n) ... number of observable replicates
#                     * Peterman (1990) includes alpha as a predictor of power, however convention ecology is fixed on a = 0.05

# There is a TRADE-OFF between Type I and Type II errors. Decreasing the probability of one, increases the probability of the other. 

# Before conducting an experiment we should always determine how likely we are to detect an effect given our experimental design 
# (i.e., A Priori power analysis). However, we can also interpret an analysis that has failed to reject the null hypothesis 
# through an A Posteriori power analysis.

#__________________________________________________________________________________________________________________________________________

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
