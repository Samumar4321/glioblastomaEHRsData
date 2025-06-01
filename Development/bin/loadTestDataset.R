library("pacman")
p_load("tidyverse", "table1", "summarytools", "dlookr")

munich2019dataset <- read.csv("../../Development/datasets/Munich2019dataset.csv")
tainan2020dataset <- read.csv("../../Development/datasets/Tainan2020dataset.csv")
utrecht2019dataset <- read.csv("../../Development/datasets/Utrecht2019dataset.csv")

#View(munich2019dataset)
#View(tainan2020dataset)
#View(utrecht2019dataset)

function() {
  utrecht2019dataset$KPS_less70.0._more70.1. <-
    factor(utrecht2019dataset$KPS_less70.0._more70.1.,
           levels = c(0,1),
           labels = c("<70", ">70"))
  utrecht2019dataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2 <-
    factor(utrecht2019dataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
           levels = c(0, 1, 2),
           labels = c("None", "Monotherapy", "RT+TMZ"))
  utrecht2019dataset$surgery_biopsy0_resection1 <-
    factor(utrecht2019dataset$surgery_biopsy0_resection1,
           levels = c(0, 1),
           labels = c("Biopsy", "Resection"))
  utrecht2019dataset$survived_yes1_no0 <-
    factor(utrecht2019dataset$survived_yes1_no0,
           levels = c(0, 1),
           labels = c("Dead","Alive"))
  utrecht2019dataset$SVZ_status_nocontact0_contact1 <-
    factor(utrecht2019dataset$SVZ_status_nocontact0_contact1,
           levels = c(0, 1),
           labels = c("No","Yes"))

  label(utrecht2019dataset$age_years) <- "Age (years)"
  label(utrecht2019dataset$KPS_less70.0._more70.1.) <- "KPS level"
  label(utrecht2019dataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2) <- "Post surgery therapy"
  label(utrecht2019dataset$surgery_biopsy0_resection1) <- "Surgery"
  label(utrecht2019dataset$survival_months) <- "OS (months)"
  label(utrecht2019dataset$survived_yes1_no0) <- "Patient status"
  label(utrecht2019dataset$SVZ_status_nocontact0_contact1) <- "SVZ contact"
}

function() {
  tainan2020dataset$chemo_yes1_no0 <-
    factor(tainan2020dataset$chemo_yes1_no0,
           levels = c(0, 1),
           labels = c("No", "Yes"))
  tainan2020dataset$sex_male0_female1 <-
    factor(tainan2020dataset$sex_male0_female1,
           levels = c(0, 1),
           labels = c("Male", "Female"))
  tainan2020dataset$surgery_yes1_biopsy0 <-
    factor(tainan2020dataset$surgery_yes1_biopsy0,
           levels = c(0, 1),
           labels = c("Biopsy", "Yes"))
  tainan2020dataset$survived_yes1_no0 <-
    factor(tainan2020dataset$survived_yes1_no0,
           levels = c(0, 1),
           labels = c("Dead", "Alive"))
  tainan2020dataset$TMZ_based_chemo_yes1_no0 <-
    factor(tainan2020dataset$TMZ_based_chemo_yes1_no0,
           levels = c(0, 1),
           labels = c("No", "Yes"))
  tainan2020dataset$tumorProgression_no0_yes1 <-
    factor(tainan2020dataset$tumorProgression_no0_yes1,
           levels = c(0, 1),
           labels = c("No", "Yes"))
  tainan2020dataset$year_of_diagnosis_05.10.0._10.16.1. <-
    factor(tainan2020dataset$year_of_diagnosis_05.10.0._10.16.1.,
           levels = c(0, 1),
           labels = c("2005-2010", "2010-2016"))

  label(tainan2020dataset$age_years) <- "Age (years)"
  label(tainan2020dataset$chemo_yes1_no0) <- "Chemotherapy"
  label(tainan2020dataset$OS_months) <- "Overall Survival (months)"
  label(tainan2020dataset$PFS_months) <- "Progression Free Survival (months)"
  label(tainan2020dataset$radiation_dose_Gy) <- "Radiation dose (Gy)"
  label(tainan2020dataset$radiation_volume_mL) <- "Radiation volume (mL)"
  label(tainan2020dataset$sex_male0_female1) <- "Sex"
  label(tainan2020dataset$surgery_yes1_biopsy0) <- "Surgery"
  label(tainan2020dataset$survived_yes1_no0) <- "Patient status"
  label(tainan2020dataset$TMZ_based_chemo_yes1_no0) <- "TMZ chemotherapy"
  label(tainan2020dataset$tumorProgression_no0_yes1) <- "Tumor progression"
  label(tainan2020dataset$year_of_diagnosis_05.10.0._10.16.1.) <- "Year of diagnosis"
}

function() {
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
}
