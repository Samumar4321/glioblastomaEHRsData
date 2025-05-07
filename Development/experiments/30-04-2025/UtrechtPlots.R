source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("ggplot2", "table1", "GGally", "patchwork")

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
         labels = c("Biopsy", "Resection"))
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

ggpairs(df)

#--------------------------------2D Age-----------------------------------------
#Plot per Age e Survived
ggplot(data = df, aes(x = age_years, y = survived_yes1_no0)) +
  geom_boxplot()
Age_2D_Survived_Freq <-
  ggplot(data = df, aes(x = age_years, color = survived_yes1_no0)) +
  geom_freqpoly(binwidth = 2) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(5)) +
  labs(x = "Age in years",
       color = "Patient status",
       title = "Age and Survived")

p1 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
         aes(x = age_years, fill = survived_yes1_no0)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "Patient Status",
       title = "Age and Survived")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
         aes(x = age_years, fill = survived_yes1_no0)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = "Age in years",
       fill = NULL)
Age_2D_Survived <- p1 / p2

#Plot per Age e KPS
ggplot(data = df, aes(x = age_years, y = KPS_less70.0._more70.1.)) +
  geom_boxplot()
Age_2D_KPS_Freq <-
  ggplot(data = df, aes(x = age_years, color = KPS_less70.0._more70.1.)) +
  geom_freqpoly(binwidth = 2) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(10)) +
  labs(x = "Age in years",
       color = "KPS level",
       title = "Age and KPS")

p1 <-
  ggplot(data = subset(df, KPS_less70.0._more70.1. == "<70"),
         aes(x = age_years, fill = KPS_less70.0._more70.1.)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 50)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "KPS level",
       title = "Age and KPS")
p2 <-
  ggplot(data = subset(df, KPS_less70.0._more70.1. == ">70"),
         aes(x = age_years, fill = KPS_less70.0._more70.1.)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 50)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, is.na(KPS_less70.0._more70.1.)),
         aes(x = age_years, fill = KPS_less70.0._more70.1.)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 50)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = "Age in years",
       fill = NULL)
Age_2D_KPS <- p1 / p2 / p3

#Plot per Age e Therapy
ggplot(data = df, aes(x = age_years, y = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_boxplot()
Age_2D_Therapy_Freq <-
  ggplot(data = df, aes(x = age_years,
                        color = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_freqpoly(binwidth = 2) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(5)) +
  labs(x = "Age in years",
       color = "post surgery Therapy",
       title = "Age and Therapy")

p1 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "None"),
         aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "post surgery Therapy",
       title = "Age and Therapy")
p2 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "Monotherapy"),
         aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "RT+TMZ"),
         aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p4 <-
  ggplot(data = subset(df, is.na(post_surgery_therapy_none0_monotherapy1_RT.TMZ2)),
         aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = "Age in years",
       fill = NULL)
Age_2D_Therapy <- p1 / p2 / p3 / p4

#Plot per Age e Surgery
ggplot(data = df, aes(x = age_years, y = surgery_biopsy0_resection1)) +
  geom_boxplot()
Age_2D_Surgery_Freq <-
  ggplot(data = df, aes(x = age_years, color = surgery_biopsy0_resection1)) +
  geom_freqpoly(binwidth = 2) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(5)) +
  labs(x = "Age in years",
       color = "Surgery type",
       title = "Age and Surgery type")

p1 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
         aes(x = age_years, fill = surgery_biopsy0_resection1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 40)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "Surgery Type",
       title = "Age and Surgery type")
p2 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
         aes(x = age_years, fill = surgery_biopsy0_resection1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 40)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = "Age in years",,
       fill = NULL)
Age_2D_Surgery <- p1 / p2

#Plot per Age e SVZ
ggplot(data = df, aes(x = age_years, y = SVZ_status_nocontact0_contact1)) +
  geom_boxplot()
Age_2D_SVZ_Freq <-
  ggplot(data = df, aes(x = age_years, color = SVZ_status_nocontact0_contact1)) +
  geom_freqpoly(binwidth = 2) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(5)) +
  labs(x = "Age in years",
       color = "SVZ contact",
       title = "Age and SVZ status")

p1 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
         aes(x = age_years, fill = SVZ_status_nocontact0_contact1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "SVZ contact",
       title = "Age and SVZ status")
p2 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
         aes(x = age_years, fill = SVZ_status_nocontact0_contact1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
         aes(x = age_years, fill = SVZ_status_nocontact0_contact1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = "Age in years",
       fill = NULL)
Age_2D_SVZ <- p1 / p2 / p3

#Plot per Age e Survival
Age_2D_OS_Box <-
  ggplot(data = df, aes(x = age_years, y = survival_months)) +
  geom_boxplot() +
  labs(x = "Age in years",
       y = "Survival in months",
       title = "Age and Survival")
ggplot(data = df, aes(x = age_years, y = survival_months)) +
  geom_bin2d()
Age_2D_OS <-
  ggplot(data = df, aes(x = age_years, y = survival_months)) +
  geom_point() +
  labs(x = "Age in years",
       y = "Survival in months",
       title = "Age and Survival")

#--------------------------------2D KPS-----------------------------------------
#Plot per KPS e Therapy
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "None"),
         aes(x = KPS_less70.0._more70.1., fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = NULL,
       fill = "post surgery Therapy",
       title = "KPS and Therapy")
p2 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "Monotherapy"),
         aes(x = KPS_less70.0._more70.1., fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "RT+TMZ"),
         aes(x = KPS_less70.0._more70.1., fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = NULL,
       fill = NULL)
p4 <-
  ggplot(data = subset(df, is.na(post_surgery_therapy_none0_monotherapy1_RT.TMZ2)),
         aes(x = KPS_less70.0._more70.1., fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = "KPS level",
       fill = NULL)
KPS_2D_Therapy <- p1 / p2 / p3 / p4

#Plot per KPS e Surgery
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = surgery_biopsy0_resection1)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
         aes(x = KPS_less70.0._more70.1., fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Surgery Type",
       title = "KPS and Surgery type")
p2 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
         aes(x = KPS_less70.0._more70.1., fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "KPS level",
       fill = NULL)
KPS_2D_Surgery <- p1 / p2

#Plot per KPS e OS
OS_2D_KPS_Freq <-
  ggplot(data = df, aes(color = KPS_less70.0._more70.1., x = survival_months)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(10)) +
  labs(x = "OS in months",
       color = "KPS level",
       title = "KPS and Survival")

p1 <-
  ggplot(data = subset(df, KPS_less70.0._more70.1. == "<70"),
         aes(fill = KPS_less70.0._more70.1., y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "KPS <70",
       y = "OS in months",
       fill = "SVZ contact",
       title = "KPS and Survival") +
  theme(legend.position = "none")
p2 <-
  ggplot(data = subset(df, KPS_less70.0._more70.1. == ">70"),
         aes(fill = KPS_less70.0._more70.1., y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "KPS >70",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p3 <-
  ggplot(data = subset(df, is.na(KPS_less70.0._more70.1.)),
         aes(fill = KPS_less70.0._more70.1., y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "NA",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
KPS_2D_OS <- p1 | p2 | p3

#Plot per KPS e Survived
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = survived_yes1_no0)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
         aes(x = KPS_less70.0._more70.1., fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Patient status",
       title = "KPS and Survived")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
         aes(x = KPS_less70.0._more70.1., fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "KPS level",
       fill = NULL)
KPS_2D_Survived <- p1 / p2

#Plot per KPS e SVZ
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
         aes(x = KPS_less70.0._more70.1., fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact",
       title = "KPS and SVZ status")
p2 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
         aes(x = KPS_less70.0._more70.1., fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
         aes(x = KPS_less70.0._more70.1., fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "KPS level",
       fill = NULL)
KPS_2D_SVZ <- p1 / p2 / p3

#--------------------------------2D Therapy-------------------------------------
#Plot per Therapy e Surgery
ggplot(data = df, aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = surgery_biopsy0_resection1)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
             fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = NULL,
       fill = "post surgery Therapy",
       title = "Therapy and Surgery type")
p2 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
             fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = "Therapy type",
       fill = NULL)
Therapy_2D_Surgery <- p1 / p2

#Plot per Therapy e OS
OS_2D_Therapy_Freq <-
  ggplot(data = df, aes(color = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, x = survival_months)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(10)) +
  labs(x = "OS in months",
       color = "post surgery Therapy",
       title = "Therapy and Survival")

p1 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "None"),
         aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "None",
       y = "OS in months",
       fill = "SVZ contact") +
  theme(legend.position = "none")
p2 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "Monotherapy"),
         aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "Monotherapy",
       y = NULL,
       fill = NULL,
       title = "Therapy and Survival") +
  theme(legend.position = "none")
p3 <-
  ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "RT+TMZ"),
         aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "RT+TMZ",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p4 <-
  ggplot(data = subset(df, is.na(post_surgery_therapy_none0_monotherapy1_RT.TMZ2)),
         aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "NA",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
Therapy_2D_OS <- p1 | p2 | p3 | p4

#Plot per Therapy e Survived
ggplot(data = df, aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survived_yes1_no0)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
             fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Patient status",
       title = "Therapy and Survived")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
             fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "Therapy type",
       fill = NULL)
Therapy_2D_Survived <- p1 / p2

#Plot per Therapy e SVZ
ggplot(data = df, aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact",
       title = "Therapy and SVZ status")
p2 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "Therapy type",
       fill = NULL)
Therapy_2D_SVZ <- p1 / p2 / p3

#--------------------------------2D Surgery-------------------------------------
#Plot per Surgery e OS
OS_2D_Surgery_Freq <-
  ggplot(data = df, aes(color = surgery_biopsy0_resection1, x = survival_months)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(10)) +
  labs(x = "OS in months",
       color = "Surgery Type",
       title = "Surgery type and Survival")

p1 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
         aes(fill = surgery_biopsy0_resection1, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "Biopsy",
       y = "OS in months",
       title = "Surgery type and Survival") +
  theme(legend.position = "none")
p2 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
         aes(fill = surgery_biopsy0_resection1, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "Resection",
       y = NULL) +
  theme(legend.position = "none")
Surgery_2D_OS <- p1 | p2

#Plot per Surgery e Survived
ggplot(data = df, aes(x = surgery_biopsy0_resection1, y = survived_yes1_no0)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
         aes(x = surgery_biopsy0_resection1, fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Patient status",
       title = "Surgery type and Survived")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
         aes(x = surgery_biopsy0_resection1, fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "Surgery Type",
       fill = "Patient status")
Surgery_2D_Survived <- p1 / p2

#Plot per Surgery e SVZ
ggplot(data = df, aes(x = surgery_biopsy0_resection1, y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
             aes(x = surgery_biopsy0_resection1, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact",
       title = "Surgery type and SVZ status")
p2 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
             aes(x = surgery_biopsy0_resection1, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p3 <- ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
             aes(x = surgery_biopsy0_resection1, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "Surgery Type",
       fill = NULL)
Surgery_2D_SVZ <- p1 / p2 / p3

#--------------------------------2D OS------------------------------------------
#Plot per OS e Survived
OS_2D_Survived_Freq <-
  ggplot(data = df, aes(x = survival_months, color = survived_yes1_no0)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(10)) +
  labs(x = "OS in months",
       color = "Patient status",
       title = "Survival and Survived")

p1 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
         aes(fill = survived_yes1_no0, x = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(y = "Dead",
       x = NULL,
       title = "Survival and Survived") +
  theme(legend.position = "none")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
         aes(fill = survived_yes1_no0, x = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(y = "Alive",
       x = "OS in months") +
  theme(legend.position = "none")
OS_2D_Survived <- p1 / p2

#Plot per OS e SVZ
OS_2D_SVZ_Freq <-
  ggplot(data = df, aes(x = survival_months, color = SVZ_status_nocontact0_contact1)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(10)) +
  labs(x = "OS in months",
       color = "SVZ contact",
       title = "Survival and SVZ status")

p1 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
         aes(fill = SVZ_status_nocontact0_contact1, x = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(y = "Count",
       x = NULL,
       fill = "SVZ contact",
       title = "Survival and SVZ status")
p2 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
         aes(fill = SVZ_status_nocontact0_contact1, x = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(y = "Count",
       x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
         aes(fill = SVZ_status_nocontact0_contact1, x = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(y = "Count",
       x = "Os in months",
       fill = NULL)
OS_2D_SVZ <- p1 / p2 / p3

#--------------------------------2D Survived------------------------------------
#Plot per Survived e SVZ
ggplot(data = df, aes(x = survived_yes1_no0, y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
         aes(x = survived_yes1_no0, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact",
       title = "Survived and SVZ status")
p2 <-
  ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
         aes(x = survived_yes1_no0, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p3 <-
  ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
         aes(x = survived_yes1_no0, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "Patient Status",
       fill = NULL)
Survived_2D_SVZ <- p1 / p2 / p3


#--------------------------------Bar plot per KPS-------------------------------
KPS_1D_Bar <-
  ggplot(data = df, aes(x = fct_infreq(KPS_less70.0._more70.1.),
                        fill = KPS_less70.0._more70.1.)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "KPS level",
       title = "KPS")

#--------------------------------Bar plot per Surgery--------------------------
Surgery_1D_Bar <-
  ggplot(data = df, aes(x = fct_infreq(surgery_biopsy0_resection1),
                        fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Surgery type",
       title ="Surgery type")

#--------------------------------Bar plot per SVZ-------------------------------
SVZ_1D_Bar <-
  ggplot(data = df, aes(x = fct_infreq(SVZ_status_nocontact0_contact1),
                        fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "SVZ contact",
       title = "SVZ status")

#--------------------------------Bar plot per Therapy---------------------------
Therapy_1D_Bar <-
  ggplot(data = df, aes(x = fct_infreq(post_surgery_therapy_none0_monotherapy1_RT.TMZ2),
                        fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "post surgery Therapy",
       title = "post surgery Therapy")

#--------------------------------Bar plot per Survived--------------------------
Survived_1D_Bar <-
  ggplot(data = df, aes(x = fct_infreq(survived_yes1_no0),
                        fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  labs(x = "Patient status",
       title = "Survived")

#--------------------------------Istogramma per Age-----------------------------
Age_1D_Isto <-
  ggplot(data = df, aes(x = age_years)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  labs(x = "Age in years",
       title = "Age")
Age_1D_Freq <-
  ggplot(data = df, aes(x = age_years)) +
  geom_freqpoly(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  labs(x = "Age in years",
       title = "Age")
Age_1D_Dens <-
  ggplot(data = df, aes(x = age_years)) +
  geom_density() +
  labs(x = "Age in years",
       title = "Age")
Age_1D_Bar <-
  ggplot(df, aes(age_years)) +
  geom_bar() +
  scale_x_binned(breaks = scales::breaks_width(5)) +
  labs(x = "Age in years",
       title = "Age")

#--------------------------------Istogramma per OS------------------------------
OS_1D_Isto <-
  ggplot(data = df, aes(x = survival_months)) + geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(2)) +
  scale_y_continuous(breaks = scales::breaks_width(4)) +
  labs(x = "OS in months",
       title = "Survived")
OS_1D_Freq <-
  ggplot(data = df, aes(x = survival_months)) + geom_freqpoly(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  labs(x = "OS in months",
       title = "Survived")
OS_1D_Dens <-
  ggplot(df, aes(x = survival_months)) +
  geom_density() +
  labs(x = "OS in months",
       title = "Survived")
OS_1D_Bar <-
  ggplot(df, aes(x = survival_months)) +
  geom_bar() +
  scale_x_binned(breaks = scales::breaks_width(5)) +
  labs(x = "OS in months",
       title = "Survived")


#--------------------------------R Markdown docu--------------------------------
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
Age_1D_Freq
Age_1D_Dens
Age_1D_Bar

OS_1D_Isto
OS_1D_Freq
OS_1D_Dens
OS_1D_Bar

KPS_1D_Bar

Surgery_1D_Bar

SVZ_1D_Bar

Therapy_1D_Bar

Survived_1D_Bar

options(warn = warn_lvl)
```
', file = "plots1D.Rmd")
rmarkdown::render("plots1D.Rmd", output_file = "Utercht_Plots_1D.pdf")
file.remove("plots1D.Rmd")

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

Age_2D_Survived_Freq
Age_2D_Survived
Age_2D_KPS_Freq
Age_2D_KPS
Age_2D_Therapy_Freq
Age_2D_Therapy
Age_2D_Surgery_Freq
Age_2D_Surgery
Age_2D_SVZ_Freq
Age_2D_SVZ
Age_2D_OS

KPS_2D_Therapy
KPS_2D_Surgery
OS_2D_KPS_Freq
KPS_2D_OS
KPS_2D_Survived
KPS_2D_SVZ

Therapy_2D_Surgery
OS_2D_Therapy_Freq
Therapy_2D_OS
Therapy_2D_Survived
Therapy_2D_SVZ

OS_2D_Surgery_Freq
Surgery_2D_OS
Surgery_2D_Survived
Surgery_2D_SVZ

OS_2D_Survived_Freq
OS_2D_Survived
OS_2D_SVZ_Freq
OS_2D_SVZ

Survived_2D_SVZ

options(warn = warn_lvl)
```
', file = "plots2D.Rmd")
rmarkdown::render("plots2D.Rmd", output_file = "Utercht_Plots_2D.pdf")
file.remove("plots2D.Rmd")
