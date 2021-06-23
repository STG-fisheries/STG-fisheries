## ------ Experimental Power Analysis in R## ------ ## 
## ------ Author:   Spencer T. Gardner## ------ ##
## ------ Date:     6/23/2021 ------ ##

# What determines if your model finds an effect?
#         - Size of the effect
#         - Variabiltiy in the effect (sd)
#         - Sample size (n) ... number of observable replicates

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
