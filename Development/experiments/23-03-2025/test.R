library(pacman)
p_load(summarytools, readxl, tidyverse, dplyr)

munichdataset <- read_excel("C:/Users/Samuele/Downloads/Lammer.xlsx", 
                            col_types = c("numeric", "text", "numeric", 
                                          "numeric", "text", "numeric", "text", 
                                          "text", "text"))
munichdataset$sex_male0_female1 <- 
  factor(munichdataset$sex_male0_female1, 
         levels=c(0, 1),
         labels=c("Male", "Female"))

munichdataset$alive_after_OS_yes1_no0 <-
  factor(munichdataset$alive_after_OS_yes1_no0,
         levels = c(0,1),
         labels = c("Dead", "Alive"))

munichdataset$tumor_progression_yes1_no0 <- 
  factor(munichdataset$tumor_progression_yes1_no0,
         levels = c(0,1),
         labels = c("No", "Yes"))

munichdataset$MGMTmethylation_methylated1_unmethylated0 <- 
  factor(munichdataset$MGMTmethylation_methylated1_unmethylated0,
         levels = c(0, 1),
         labels = c("No", "Yes"))

munichdataset$cHsp70_low0_high1 <-
  factor(munichdataset$cHsp70_low0_high1,
         levels = c(0, 1),
         labels = c("Low", "High"))

label(munichdataset$sex_male0_female1) <- "Sex"

munichdataset %>% 
  select(-patient_ID) %>% 
  dfSummary(
    graph.col = TRUE,
    style="grid",
    graph.magnif = 1
  ) %>% stview()

munichdataset %>% select(-patient_ID) %>% descr() %>% stview()
munichdataset %>% select(-patient_ID) %>% freq() %>% stview()

