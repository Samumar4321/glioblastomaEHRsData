library("pacman")
p_load("tidyverse")
if(!grepl("GitHub/glioblastomaEHRsData/Development", getwd())) 
  setwd("./GitHub/glioblastomaEHRsData/Development")
  
munich2019dataset <- read.csv("./datasets/Munich2019dataset.csv")
tainan2020dataset <- read.csv("./datasets/Tainan2020dataset.csv")
utrecht2019dataset <- read.csv("./datasets/Utrecht2019dataset.csv")
  
View(munich2019dataset)
View(tainan2020dataset)
View(utrecht2019dataset)
