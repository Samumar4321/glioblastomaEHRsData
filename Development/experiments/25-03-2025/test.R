library(pacman)
p_load(tidyverse, Hmisc, readxl)

munichdataset <- read_excel("C:/Users/Samuele/Downloads/Lammer.xlsx", 
                            col_types = c("numeric", "text", "numeric", 
                                          "numeric", "text", "numeric", "text", 
                                          "text", "text"))
munichdataset %>%  summary(fun = table)

munichdataset %>% describe()