#Data Cleaning for Data
  #written by Cora Allen-Coleman & Kelly Savietta
library(tidyverse)
#set working directory
setwd("/Users/cora/git_repos/dynamic_network_viz/Classroom_RSienaSession")

#26 students
time1 <- read.table("classroom_net1.dat", header=FALSE)
time2 <- read.table("classroom_net2.dat", 
                    header=FALSE)
time3 <- read.table("classroom_net3.dat", 
                    header=FALSE)
time4 <- read.table("classroom_net4.dat", 
                    header=FALSE)
colnames(time4) <- seq(1:26)
primary <- read.table("classroom_primary.dat", header=FALSE) #changing dyadic covariate primary: (Have you gone to the same primary school?) 0 = no, 1 = yes
alcohol <- read.table("classroom_alcohol.dat", #changing individual covariate alcohol: (How often did you drink alcohol with friends in the last three months?) 1 = never, 2 = once, 3 = 2-4 times, 4 = 5-10 times, 5 = more that 10 times
                    header=FALSE)
gender <- read.table("classroom_demographics.dat", #constant individual covariate sex: 1 = girl, 2 = boy
                    header=FALSE)
RSiena <- read.csv("classroom_RSienaSessionFile.csv", header = FALSE)

## NODES ##
#use gender df as user df (NODES)
gender$id <- seq(1:26) 
colnames(gender) <- c("gender", "id")
#reorder columns of df
gender <- gender[, c(2, 1)]

#EDGES
library(igraph)
time4 <- mutate_all(time4, function(x) as.double(x))
time4 <- as.matrix(time4)
time4_edges <- get.edgelist(graph_from_adjacency_matrix(time4))
time4_edges <- as.data.frame(time4_edges) #to df
colnames(time4_edges) <- c("source", "target")

#convert to json
library(rjson)
time4_json <- toJSON(time4_edges)
time4_json
