source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("ggplot2", "table1")

df <- utrecht2019dataset

df$KPS_less70.0._more70.1. <-
  factor(df$KPS_less70.0._more70.1.,
         levels = c(0,1),
         labels = c("<70", ">70"))
df$post_surgery_therapy_none0_monotherapy1_RT.TMZ2 <-
  factor(df$post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
         levels = c(0, 1, 2),
         labels = c("None", "Monotherapy", "RT+TMZ"))
df$surgery_biopsy0_resection1 <-
  factor(df$surgery_biopsy0_resection1,
         levels = c(0, 1),
         labels = c("Biopsy", "Reselection"))
df$survived_yes1_no0 <-
  factor(df$survived_yes1_no0,
         levels = c(0, 1),
         labels = c("Dead","Alive"))
df$SVZ_status_nocontact0_contact1 <-
  factor(df$SVZ_status_nocontact0_contact1,
         levels = c(0, 1),
         labels = c("No","Yes"))

label(df$age_years) <- "Age (years)"
label(df$KPS_less70.0._more70.1.) <- "KPS level"
label(df$post_surgery_therapy_none0_monotherapy1_RT.TMZ2) <- "Post surgery therapy"
label(df$surgery_biopsy0_resection1) <- "Surgery"
label(df$survival_months) <- "OS (months)"
label(df$survived_yes1_no0) <- "Patient status"
label(df$SVZ_status_nocontact0_contact1) <- "SVZ contact"

#Bar plot per KPS
ggplot(data = df, aes(x = KPS_less70.0._more70.1.)) + geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  xlab("KPS Level") +
  ylab("Count")

#Bar plot per Surgery
ggplot(data = df, aes(x = surgery_biopsy0_resection1)) + geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  xlab("Surgery type") +
  ylab("Count")


#Bar plot per SVZ
ggplot(data = df, aes(x = SVZ_status_nocontact0_contact1)) + geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  xlab("SVZ contact") +
  ylab("Count")


#Bar plot per Therapy
ggplot(data = df, aes(y = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) + geom_bar() +
  scale_x_continuous(breaks = scales::breaks_width(50)) +
  xlab("Post surgery Therapy") +
  ylab("Count")


#Bar plot per Survived
ggplot(data = df, aes(x = survived_yes1_no0)) + geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  xlab("Patient status") +
  ylab("Count")

#Istogramma per Age
ggplot(data = df, aes(x = age_years)) + geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(width = 2)) +
  xlab("Age in years") +
  ylab("Count")

#Istogramma per Survival months
ggplot(data = df, aes(x = survival_months)) + geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  xlab("Survived months") +
  ylab("Count")
ggplot(data = df, aes(x = survival_months)) + geom_freqpoly(binwidth = 0.1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  xlab("Survived months") +
  ylab("Count")
