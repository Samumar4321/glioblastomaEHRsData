source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("table1")

df <- munich2019dataset

df$sex_male0_female1 <-
  factor(df$sex_male0_female1,
         levels=c(0, 1),
         labels=c("Male", "Female"))

df$survived_yes1_no0 <-
  factor(df$survived_yes1_no0,
         levels = c(0,1),
         labels = c("Dead", "Alive"))

df$tumor_progression_yes1_no0 <-
  factor(df$tumor_progression_yes1_no0,
         levels = c(0,1),
         labels = c("No", "Yes"))

df$MGMTmethylation_methylated1_unmethylated0 <-
  factor(df$MGMTmethylation_methylated1_unmethylated0,
         levels = c(0, 1),
         labels = c("No", "Yes"))

df$cHsp70_low0_high1 <-
  factor(df$cHsp70_low0_high1,
         levels = c(0, 1),
         labels = c("Low", "High"))

label(df$sex_male0_female1) <- "Sex"
label(df$age_years) <- "Age (years)"
label(df$OS_months) <- "Overall Survival (months)"
label(df$survived_yes1_no0) <- "Alive"
label(df$PFS_months) <- "Progress Free Survival (months)"
label(df$tumor_progression_yes1_no0) <- "Tumor progression"
label(df$MGMTmethylation_methylated1_unmethylated0)  <- "MGMT Methylation"
label(df$cHsp70_low0_high1) <- "cHsp70 level"

t1 <- table1(~ sex_male0_female1 +
               age_years +
               OS_months +
               survived_yes1_no0 +
               PFS_months +
               tumor_progression_yes1_no0 +
               MGMTmethylation_methylated1_unmethylated0 +
               cHsp70_low0_high1,
             data = df,
             topclass = "Rtable1-shade",
             render.continous = c( .= "Mean [MIN - MAX]",
                                   .= "Median (SD%)",
                                   .= "Q1 - Q3"))

t2 <- table1(~ sex_male0_female1 +
               age_years +
               OS_months +
               PFS_months +
               tumor_progression_yes1_no0 +
               MGMTmethylation_methylated1_unmethylated0 +
               cHsp70_low0_high1 |
               survived_yes1_no0,
             data = df,
             topclass = "Rtable1-shade",
             render.continous = c( .= "Mean [MIN - MAX]",
                                   .= "Median (SD%)",
                                   .= "Q1 - Q3"))
