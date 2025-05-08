source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("ggplot2", "table1")

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

#Bar plot per Sex
Sex_1D_Bar <-
  ggplot(data = df, aes(sex_male0_female1)) +
  geom_bar() +
  labs(x = "Sex",
       title = "Sex")

#Istagramma e Freq plot per Age
Age_1D_Isto <-
  ggplot(data = df, aes(age_years)) +
  geom_histogram(binwidth = 2) +
  labs(x = "Age in years",
       title = "Age")
Age_1D_Freq <-
  ggplot(data = df, aes(age_years)) +
  geom_freqpoly(binwidth = 2) +
  labs(x = "Age in years",
       title = "Age")
Age_1D_Dens <-
  ggplot(df, aes(x = age_years)) +
  geom_density() +
  labs(x = "Age in years",
       title = "Age")
Age_1D_Bar <-
  ggplot(df, aes(x = age_years)) +
  geom_bar() +
  scale_x_binned(breaks = scales::breaks_width(5)) +
  labs(x = "Age in years",
       title = "Age")

#Istogramma e Freq plot per OS
OS_1D_Isto <-
  ggplot(data = df, aes(OS_months)) +
  geom_histogram(binwidth = 2) +
  labs(x = "OS in months",
       title = "Overall Survival")
OS_1D_Freq <-
  ggplot(data = df, aes(OS_months)) +
  geom_freqpoly(binwidth = 2) +
  labs(x = "OS in months",
       title = "Overall Survival")
OS_1D_Dens <-
  ggplot(df, aes(x = OS_months)) +
  geom_density() +
  labs(x = "OS in months",
       title = "Overall Survival")
OS_1D_Bar <-
  ggplot(df, aes(x = OS_months)) +
  geom_bar() +
  scale_x_binned(breaks = scales::breaks_width(5)) +
  labs(x = "OS in months",
       title = "Overall Survival")

#Bar plot per Survived
Survived_1D_Bar <-
  ggplot(data = df, aes(survived_yes1_no0)) +
  geom_bar() +
  labs(x = "Patient Status",
       title = "Survived")

#Istogramma e Freq plot per PFS
PFS_1D_Isto <-
  ggplot(data = df, aes(PFS_months)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  labs(x = "PFS in months",
       title = "Progress Free Survival")
PFS_1D_Freq <-
  ggplot(data = df, aes(PFS_months)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_extended(n = 6)) +
  labs(x = "PFS in months",
       title = "Progress Free Survival")
PFS_1D_Dens <-
  ggplot(data = df, aes(PFS_months)) +
  geom_density() +
  labs(x = "PFS in months",
       title = "Progress Free Survival")
PFS_1D_Bar <-
  ggplot(data = df, aes(PFS_months)) +
  geom_bar() +
  scale_x_binned(breaks = scales::breaks_width(5)) +
  labs(x = "PFS in months",
       title = "Progress Free Survival")

#Bar plot per Tumor Progression
Progress_1D_Bar <-
  ggplot(data = df, aes(tumor_progression_yes1_no0)) +
  geom_bar() +
  labs(x = "Tumor progression",
       title = "Tumor progression")

#Bar plot per MGMT
MGMT_1D_Bar <-
  ggplot(data = df, aes(MGMTmethylation_methylated1_unmethylated0)) +
  geom_bar() +
  labs(x = "MGMT methylated patient",
       title = "MGMT methylation")

#Bar plot per cHsp70
cHsp_1D_Bar <-
  ggplot(data = df, aes(cHsp70_low0_high1)) +
  geom_bar() +
  labs(x = "cHsp70 level",
       title = "cHsp70")

cat('
---
title: "Report"
author: "XXX"
date: "today"
output: pdf_document
---

```{r show-flextable, echo=FALSE, result="asis"}

warn_lvl <- getOption("warn")
options(warn = -1)

Sex_1D_Bar

Age_1D_Isto
Age_1D_Freq
Age_1D_Dens
Age_1D_Bar

OS_1D_Isto
OS_1D_Freq
OS_1D_Dens
OS_1D_Bar

PFS_1D_Isto
PFS_1D_Freq
PFS_1D_Dens
PFS_1D_Bar

Survived_1D_Bar

Progress_1D_Bar

MGMT_1D_Bar

cHsp_1D_Bar

options(warn = warn_lvl)
```
', file = "plots1D.Rmd")
rmarkdown::render("plots1D.Rmd", output_file = "Munich_Plots_1D.pdf")
file.remove("plots1D.Rmd")
