library(pacman)
p_load(table1)

tainan2020dataset <- read.csv("data-raw/Tainan2020dataset.csv",
                              colClasses = c(
                                "chemo_yes1_no0" = "character",
                                "sex_male0_female1" = "character",
                                "surgery_resection1_biopsy0" = "character",
                                "survived_yes1_no0" = "character",
                                "TMZ_based_chemo_yes1_no0" = "character",
                                "tumorProgression_no0_yes1" = "character",
                                "year_of_diagnosis_05to10_0_10to16_1" = "character"
                              ))

tainan2020dataset$chemo_yes1_no0 <-
  factor(tainan2020dataset$chemo_yes1_no0,
         levels = c(0, 1),
         labels = c("No", "Yes"))
tainan2020dataset$sex_male0_female1 <-
  factor(tainan2020dataset$sex_male0_female1,
         levels = c(0, 1),
         labels = c("Male", "Female"))
tainan2020dataset$surgery_resection1_biopsy0 <-
  factor(tainan2020dataset$surgery_resection1_biopsy0,
         levels = c(0, 1),
         labels = c("Biopsy", "Resection"))
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
tainan2020dataset$year_of_diagnosis_05to10_0_10to16_1 <-
  factor(tainan2020dataset$year_of_diagnosis_05to10_0_10to16_1,
         levels = c(0, 1),
         labels = c("2005-2010", "2010-2016"))

label(tainan2020dataset$age_years) <- "Age (years)"
label(tainan2020dataset$chemo_yes1_no0) <- "Chemotherapy"
label(tainan2020dataset$OS_months) <- "Overall Survival (months)"
label(tainan2020dataset$PFS_months) <- "Progression Free Survival (months)"
label(tainan2020dataset$radiation_dose_Gy) <- "Radiation dose (Gy)"
label(tainan2020dataset$radiation_volume_mL) <- "Radiation volume (mL)"
label(tainan2020dataset$sex_male0_female1) <- "Sex"
label(tainan2020dataset$surgery_resection1_biopsy0) <- "Surgery"
label(tainan2020dataset$survived_yes1_no0) <- "Patient status"
label(tainan2020dataset$TMZ_based_chemo_yes1_no0) <- "TMZ chemotherapy"
label(tainan2020dataset$tumorProgression_no0_yes1) <- "Tumor progression"
label(tainan2020dataset$year_of_diagnosis_05to10_0_10to16_1) <- "Year of diagnosis"

usethis::use_data(tainan2020dataset, overwrite = TRUE)
