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
ggplot(data = df, aes(x = age_years)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  theme(legend.position = "none") +
  xlab("Age in years") +
  ylab("Count")

#Istogramma per OS
ggplot(data = df, aes(x = OS_months)) +
  geom_histogram(binwidth = 0.75) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  theme(legend.position = "none") +
  xlab("Overall Survival in months") +
  ylab("Count")

#Istogramma per PFS
ggplot(data = df, aes(x = PFS_months)) +
  geom_freqpoly(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  theme(legend.position = "none") +
  xlab("Progress Free Survival in months") +
  ylab("Count")

#Istogramma per RadiationDose
ggplot(data = df, aes(x = radiation_dose_Gy)) +
  geom_freqpoly(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(1)) +
  scale_y_continuous(breaks = scales::breaks_width(5)) +
  theme(legend.position = "none") +
  xlab("Radiation Dose in Gy") +
  ylab("Count")

#Istogramma per RadiationVolume
ggplot(data = df, aes(x = radiation_volume_mL)) +
  geom_freqpoly(binwidth = 15) +
  scale_x_continuous(breaks = scales::breaks_width(100)) +
  scale_y_continuous(breaks = scales::breaks_width(1)) +
  theme(legend.position = "none") +
  xlab("Radiation Volume in mL") +
  ylab("Count")

#Bar plot per Chemo
ggplot(data = df, aes(x = chemo_yes1_no0,
                      fill = chemo_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Chemotherapy") +
  ylab("Count")

#Bar plot per Sex
ggplot(data = df, aes(x = sex_male0_female1,
                      fill = sex_male0_female1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Sex") +
  ylab("Count")

#Bar plot per Surgery
ggplot(data = df, aes(x = surgery_yes1_biopsy0,
                      fill = surgery_yes1_biopsy0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Surgery") +
  ylab("Count")

#Bar plot per Survived
ggplot(data = df, aes(x = survived_yes1_no0,
                      fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Patient status") +
  ylab("Count")

#Bar plot per TMZ
ggplot(data = df, aes(x = TMZ_based_chemo_yes1_no0,
                      fill = TMZ_based_chemo_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("TMZ based chemotherapy") +
  ylab("Count")

#Bar plot per TumorProgress
ggplot(data = df, aes(x = tumorProgression_no0_yes1,
                      fill = tumorProgression_no0_yes1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Tumor progression") +
  ylab("Count")

#Bar plot per YearOfDiagnosis
ggplot(data = df, aes(x = year_of_diagnosis_05.10.0._10.16.1.,
                      fill = year_of_diagnosis_05.10.0._10.16.1.)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Year of first diagnosis") +
  ylab("Count")
