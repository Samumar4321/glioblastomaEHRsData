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
ggplot(data = df, aes(sex_male0_female1)) + geom_bar() + xlab("Sex") +
  ylab("Count")

#Istagramma e Freq plot per Age
ggplot(data = df, aes(age_years)) + geom_histogram(binwidth = 2) +
  xlab("Age in years") +
  ylab("Count")
ggplot(data = df, aes(age_years)) + geom_freqpoly(binwidth = 2) +
  xlab("Age in years") +
  ylab("Count")

#Istogramma e Freq plot per OS
ggplot(data = df, aes(OS_months)) + geom_histogram(binwidth = 2) +
  xlab("Overall Survival in months") +
  ylab("Count")
ggplot(data = df, aes(OS_months)) + geom_freqpoly(binwidth = 2) +
  xlab("Overall Survival in months") +
  ylab("Count")

#Bar plot per Survived
ggplot(data = df, aes(survived_yes1_no0)) + geom_bar() +
  xlab("Patient Status") +
  ylab("Count")

#Istogramma e Freq plot per PFS
ggplot(data = df, aes(PFS_months)) + geom_histogram(binwidth = 1, fill = "black", colour = "gray") +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  xlab("Progress Free Survival in months") +
  ylab("Count")
ggplot(data = df, aes(PFS_months)) + geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_extended(n = 6)) +
  xlab("Progress Free Survival in months") +
  ylab("Count")

#Bar plot per Tumor Progression
ggplot(data = df, aes(tumor_progression_yes1_no0)) + geom_bar() +
  xlab("Tumor progression") +
  ylab("Count")

#Bar plot per MGMT
ggplot(data = df, aes(MGMTmethylation_methylated1_unmethylated0)) + geom_bar() +
  xlab("MGMT Methylation patients") +
  ylab("Count")

#Bar plot per cHsp70
ggplot(data = df, aes(cHsp70_low0_high1)) + geom_bar() +
  xlab("cHsp70 level") +
  ylab("Count")

