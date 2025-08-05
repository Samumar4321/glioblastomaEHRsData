library(pacman)
p_load(table1)

munich2019dataset <- read.csv("data-raw/Munich2019dataset.csv",
                              colClasses = c(
                                "cHsp70_low0_high1" = "character",
                                "sex_male0_female1" = "character",
                                "survived_yes1_no0" = "character",
                                "tumor_progression_yes1_no0" = "character",
                                "MGMTmethylation_methylated1_unmethylated0" = "character"
                              ))
munich2019dataset$sex_male0_female1 <-
  factor(munich2019dataset$sex_male0_female1,
         levels=c(0, 1),
         labels=c("Male", "Female"))

munich2019dataset$survived_yes1_no0 <-
  factor(munich2019dataset$survived_yes1_no0,
         levels = c(0,1),
         labels = c("Dead", "Alive"))

munich2019dataset$tumor_progression_yes1_no0 <-
  factor(munich2019dataset$tumor_progression_yes1_no0,
         levels = c(0,1),
         labels = c("No", "Yes"))

munich2019dataset$MGMTmethylation_methylated1_unmethylated0 <-
  factor(munich2019dataset$MGMTmethylation_methylated1_unmethylated0,
         levels = c(0, 1),
         labels = c("No", "Yes"))

munich2019dataset$cHsp70_low0_high1 <-
  factor(munich2019dataset$cHsp70_low0_high1,
         levels = c(0, 1),
         labels = c("Low", "High"))

label(munich2019dataset$sex_male0_female1) <- "Sex"
label(munich2019dataset$age_years) <- "Age (years)"
label(munich2019dataset$OS_months) <- "Overall Survival (months)"
label(munich2019dataset$survived_yes1_no0) <- "Alive"
label(munich2019dataset$PFS_months) <- "Progress Free Survival (months)"
label(munich2019dataset$tumor_progression_yes1_no0) <- "Tumor progression"
label(munich2019dataset$MGMTmethylation_methylated1_unmethylated0)  <- "MGMT Methylation"
label(munich2019dataset$cHsp70_low0_high1) <- "cHsp70 level"

usethis::use_data(munich2019dataset, overwrite = TRUE)
