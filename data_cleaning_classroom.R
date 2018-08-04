#Data Cleaning for Data
  #written by Cora Allen-Coleman & Kelly Savietta
library(tidyverse)
library(igraph)
library(rjson)


#set working directory
setwd("/Users/cora/git_repos/dynamic_network_viz/data")

#26 students
time1 <- read.table("classroom_net1.dat", header=FALSE)
colnames(time1) <- seq(1:26)
time2 <- read.table("classroom_net2.dat", header=FALSE)
colnames(time2) <- seq(1:26)
time3 <- read.table("classroom_net3.dat", header=FALSE)
colnames(time3) <- seq(1:26)
time4 <- read.table("classroom_net4.dat", header=FALSE)
colnames(time4) <- seq(1:26)
primary <- read.table("classroom_primary.dat", header=FALSE) #changing dyadic covariate primary: (Have you gone to the same primary school?) 0 = no, 1 = yes
alcohol <- read.table("classroom_alcohol.dat", #changing individual covariate alcohol: (How often did you drink alcohol with friends in the last three months?) 1 = never, 2 = once, 3 = 2-4 times, 4 = 5-10 times, 5 = more that 10 times
                    header=FALSE)
gender <- read.table("classroom_demographics.dat", #constant individual covariate sex: 1 = girl, 2 = boy
                    header=FALSE)
#RSiena <- read.csv("classroom_RSienaSessionFile.csv", header = FALSE)

## NODES ##
#use gender df as user df (NODES)
gender$id <- seq(1:26) 
colnames(gender) <- c("gender", "id")
#reorder columns of df
gender <- gender[, c(2, 1)]

#EDGES
time1 <- mutate_all(time1, function(x) as.double(x))
time1_edges <- as.data.frame(get.edgelist(graph_from_adjacency_matrix(as.matrix(time1))))
colnames(time1_edges) <- c("source", "target")

time2 <- mutate_all(time2, function(x) as.double(x))
time2_edges <- as.data.frame(get.edgelist(graph_from_adjacency_matrix(as.matrix(time2))))
colnames(time2_edges) <- c("source", "target")

time3 <- mutate_all(time3, function(x) as.double(x))
time3_edges <- as.data.frame(get.edgelist(graph_from_adjacency_matrix(as.matrix(time3))))
colnames(time3_edges) <- c("source", "target")

time4 <- mutate_all(time4, function(x) as.double(x))
time4_edges <- as.data.frame(get.edgelist(graph_from_adjacency_matrix(as.matrix(time4))))
colnames(time4_edges) <- c("source", "target")

#convert to json
time1_json <- toJSON(unname(split(time1_edges, 1:nrow(time1_edges))))
write(time1_json, "time1_json.json")

time2_json <- toJSON(unname(split(time2_edges, 1:nrow(time2_edges))))
write(time2_json, "time2_json.json")

time3_json <- toJSON(unname(split(time3_edges, 1:nrow(time3_edges))))
write(time3_json, "time3_json.json")

time4_json <- toJSON(unname(split(time4_edges, 1:nrow(time4_edges))))
write(time4_json, "time4_json.json")

gender_json <- toJSON(unname(split(gender, 1:nrow(gender))))
write(gender_json, "gender.json")
