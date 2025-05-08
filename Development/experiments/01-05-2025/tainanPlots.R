source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("ggplot2", "table1")

df <- tainan2020dataset

df$chemo_yes1_no0 <-
  factor(df$chemo_yes1_no0,
         levels = c(0, 1),
         labels = c("No", "Yes"))
df$sex_male0_female1 <-
  factor(df$sex_male0_female1,
         levels = c(0, 1),
         labels = c("Male", "Female"))
df$surgery_yes1_biopsy0 <-
  factor(df$surgery_yes1_biopsy0,
         levels = c(0, 1),
         labels = c("Biopsy", "Yes"))
df$survived_yes1_no0 <-
  factor(df$survived_yes1_no0,
         levels = c(0, 1),
         labels = c("Dead", "Alive"))
df$TMZ_based_chemo_yes1_no0 <-
  factor(df$TMZ_based_chemo_yes1_no0,
         levels = c(0, 1),
         labels = c("No", "Yes"))
df$tumorProgression_no0_yes1 <-
  factor(df$tumorProgression_no0_yes1,
         levels = c(0, 1),
         labels = c("No", "Yes"))
df$year_of_diagnosis_05.10.0._10.16.1. <-
  factor(df$year_of_diagnosis_05.10.0._10.16.1.,
         levels = c(0, 1),
         labels = c("2005-2010", "2010-2016"))

label(df$age_years) <- "Age (years)"
label(df$chemo_yes1_no0) <- "Chemotherapy"
label(df$OS_months) <- "Overall Survival (months)"
label(df$PFS_months) <- "Progression Free Survival (months)"
label(df$radiation_dose_Gy) <- "Radiation dose (Gy)"
label(df$radiation_volume_mL) <- "Radiation volume (mL)"
label(df$sex_male0_female1) <- "Sex"
label(df$surgery_yes1_biopsy0) <- "Surgery"
label(df$survived_yes1_no0) <- "Patient status"
label(df$TMZ_based_chemo_yes1_no0) <- "TMZ chemotherapy"
label(df$tumorProgression_no0_yes1) <- "Tumor progression"
label(df$year_of_diagnosis_05.10.0._10.16.1.) <- "Year of diagnosis"

#Istogramma per Age
Age_1D_Isto <-
  ggplot(data = df, aes(x = age_years)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  labs(x = "Age in years",
       title = "Age")

#Istogramma per OS
OS_1D_Isto <-
  ggplot(data = df, aes(x = OS_months)) +
  geom_histogram(binwidth = 0.75) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  labs(x = "OS in months",
       title = "Overall Survival")

#Istogramma per PFS
PFS_1D_Isto <-
  ggplot(data = df, aes(x = PFS_months)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  labs(x = "PFS in months",
       title = "Progress Free Survival")

#Istogramma per RadiationDose
RD_1D_Isto <-
  ggplot(data = df, aes(x = radiation_dose_Gy)) +
  geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(1)) +
  scale_y_continuous(breaks = scales::breaks_width(5)) +
  labs(x = "Radiation Dose in Gy",
       title = "Radiation Dose")

#Istogramma per RadiationVolume
RV_1D_Isto <-
  ggplot(data = df, aes(x = radiation_volume_mL)) +
  geom_histogram(binwidth = 15) +
  scale_x_continuous(breaks = scales::breaks_width(100)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  labs(x = "Radiation Volume in mL",
       title = "Radiation Volume")

#Bar plot per Chemo
Chemo_1D_Bar <-
  ggplot(data = df, aes(x = chemo_yes1_no0,
                        fill = chemo_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Chemotherapy",
       title = "Chemotherapy")

#Bar plot per Sex
Sex_1D_Bar <-
  ggplot(data = df, aes(x = sex_male0_female1,
                        fill = sex_male0_female1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Sex",
       title = "Sex")

#Bar plot per Surgery
Surgery_1D_Bar <-
  ggplot(data = df, aes(x = surgery_yes1_biopsy0,
                        fill = surgery_yes1_biopsy0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Surgery",
       title = "Surgery")

#Bar plot per Survived
Survived_1D_Bar <-
  ggplot(data = df, aes(x = survived_yes1_no0,
                        fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Patient status",
       title = "Survived")

#Bar plot per TMZ
TMZ_1D_Bar <-
  ggplot(data = df, aes(x = TMZ_based_chemo_yes1_no0,
                        fill = TMZ_based_chemo_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "TMZ",
       title = "TMZ based chemotherapy")

#Bar plot per TumorProgress
Progress_1D_Bar <-
  ggplot(data = df, aes(x = tumorProgression_no0_yes1,
                        fill = tumorProgression_no0_yes1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Progresss",
       title = "Tumor progression")

#Bar plot per YearOfDiagnosis
Year_1D_Bar <-
  ggplot(data = df, aes(x = year_of_diagnosis_05.10.0._10.16.1.,
                        fill = year_of_diagnosis_05.10.0._10.16.1.)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Year",
       title = "Year of first diagnosis")

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

Age_1D_Isto

OS_1D_Isto

PFS_1D_Isto

RD_1D_Isto

RV_1D_Isto

Sex_1D_Bar

Survived_1D_Bar

Surgery_1D_Bar

Chemo_1D_Bar

TMZ_1D_Bar

Progress_1D_Bar

Year_1D_Bar

options(warn = warn_lvl)
```
', file = "plots1D.Rmd")
rmarkdown::render("plots1D.Rmd", output_file = "Tainan_Plots_1D.pdf")
file.remove("plots1D.Rmd")
