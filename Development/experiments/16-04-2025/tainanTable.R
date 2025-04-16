source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("table1")

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

t1 <- table1(~ sex_male0_female1 +
               age_years +
               OS_months +
               PFS_months +
               tumorProgression_no0_yes1 +
               survived_yes1_no0 +
               surgery_yes1_biopsy0 +
               chemo_yes1_no0 +
               TMZ_based_chemo_yes1_no0 +
               radiation_dose_Gy +
               radiation_volume_mL +
               year_of_diagnosis_05.10.0._10.16.1.,
             data = df,
             topclass = "Rtable1-shade",
             render.continuous = c(.= "Median [MIN - MAX]",
                                  .= "Mean (SD)",
                                  .= "Q1 - Q3")
             )

t2 <- table1(~ sex_male0_female1 +
               age_years +
               OS_months +
               PFS_months +
               tumorProgression_no0_yes1 +
               surgery_yes1_biopsy0 +
               chemo_yes1_no0 +
               TMZ_based_chemo_yes1_no0 +
               radiation_dose_Gy +
               radiation_volume_mL +
               year_of_diagnosis_05.10.0._10.16.1.
             |
               survived_yes1_no0,
             data = df,
             topclass = "Rtable1-shade",
             render.continuous = c(.= "Median [MIN - MAX]",
                                   .= "Mean (SD)",
                                   .= "Q1 - Q3")
)

t3 <- table1(~ age_years +
               OS_months +
               PFS_months +
               tumorProgression_no0_yes1 +
               survived_yes1_no0 +
               surgery_yes1_biopsy0 +
               chemo_yes1_no0 +
               TMZ_based_chemo_yes1_no0 +
               radiation_dose_Gy +
               radiation_volume_mL +
               year_of_diagnosis_05.10.0._10.16.1.
             |
               sex_male0_female1,
             data = df,
             topclass = "Rtable1-shade",
             render.continuous = c(.= "Median [MIN - MAX]",
                                   .= "Mean (SD)",
                                   .= "Q1 - Q3")
)
