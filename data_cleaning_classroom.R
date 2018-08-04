#Data Cleaning for Data
  #written by Cora Allen-Coleman & Kelly Savietta
library(tidyverse)
#set working directory
setwd("/Users/cora/git_repos/dynamic_network_viz/Classroom_RSienaSession")
#readLines("classroom_net1.dat", n = 10)
time1 <- read.table("classroom_net1.dat", header=TRUE)
time2 <- read.table("classroom_net2.dat", 
                    header=TRUE)
time3 <- read.table("classroom_net3.dat", 
                    header=TRUE)
time4 <- read.table("classroom_net4.dat", 
                    header=TRUE)
primary <- read.table("classroom_primary.dat", header=TRUE) #changing dyadic covariate primary: (Have you gone to the same primary school?) 0 = no, 1 = yes
alcohol <- read.table("classroom_alcohol.dat", #changing individual covariate alcohol: (How often did you drink alcohol with friends in the last three months?) 1 = never, 2 = once, 3 = 2-4 times, 4 = 5-10 times, 5 = more that 10 times
                    header=TRUE)
gender <- read.table("classroom_demographics.dat", #constant individual covariate sex: 1 = girl, 2 = boy
                    header=TRUE)
RSiena <- read.csv("classroom_RSienaSessionFile.csv", header = TRUE)

#combine into one dataframe
bind_cols(gender)

#convert to json
library(rjson)
x <- toJSON(gender)
x[1]
