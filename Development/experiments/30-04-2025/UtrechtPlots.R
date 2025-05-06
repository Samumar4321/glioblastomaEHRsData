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

#--------------------------------2D Age-----------------------------------------
#Plot per Age e Survived
ggplot(data = df, aes(x = age_years, y = survived_yes1_no0)) +
  geom_boxplot()
ggplot(data = df, aes(x = age_years, color = survived_yes1_no0)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
             aes(x = age_years, fill = survived_yes1_no0)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "Patient Status")
p2 <- ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
             aes(x = age_years, fill = survived_yes1_no0)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2

#Plot per Age e KPS
ggplot(data = df, aes(x = age_years, y = KPS_less70.0._more70.1.)) +
  geom_boxplot()
ggplot(data = df, aes(x = age_years, color = KPS_less70.0._more70.1.)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, KPS_less70.0._more70.1. == "<70"),
             aes(x = age_years, fill = KPS_less70.0._more70.1.)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 50)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "KPS level")
p2 <- ggplot(data = subset(df, KPS_less70.0._more70.1. == ">70"),
             aes(x = age_years, fill = KPS_less70.0._more70.1.)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 50)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p3 <- ggplot(data = subset(df, is.na(KPS_less70.0._more70.1.)),
             aes(x = age_years, fill = KPS_less70.0._more70.1.)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 50)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(fill = NULL)
  p1 / p2 / p3

#Plot per Age e Therapy
ggplot(data = df, aes(x = age_years, y = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_boxplot()
ggplot(data = df, aes(x = age_years, color = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "None"),
             aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "post surgery Therapy")
p2 <- ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "Monotherapy"),
             aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p3 <- ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "RT+TMZ"),
             aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p4 <- ggplot(data = subset(df, is.na(post_surgery_therapy_none0_monotherapy1_RT.TMZ2)),
             aes(x = age_years, fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(fill = NULL)
p1 / p2 / p3 / p4

#Plot per Age e Surgery
ggplot(data = df, aes(x = age_years, y = surgery_biopsy0_resection1)) +
  geom_boxplot()
ggplot(data = df, aes(x = age_years, color = surgery_biopsy0_resection1)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
             aes(x = age_years, fill = surgery_biopsy0_resection1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 40)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "Surgery Type")
p2 <- ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
             aes(x = age_years, fill = surgery_biopsy0_resection1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 40)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2

#Plot per Age e SVZ
ggplot(data = df, aes(x = age_years, y = SVZ_status_nocontact0_contact1)) +
  geom_boxplot()
ggplot(data = df, aes(x = age_years, color = SVZ_status_nocontact0_contact1)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
             aes(x = age_years, fill = SVZ_status_nocontact0_contact1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = "SVZ contact")
p2 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
             aes(x = age_years, fill = SVZ_status_nocontact0_contact1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(x = NULL,
       fill = NULL)
p3 <- ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
             aes(x = age_years, fill = SVZ_status_nocontact0_contact1)) +
  geom_histogram(binwidth = 2) +
  scale_y_continuous(breaks = scales::breaks_width(10), limits = c(0, 45)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(15, 95)) +
  labs(fill = NULL)
p1 / p2 / p3

#Plot per Age e Survival
ggplot(data = df, aes(x = age_years, y = survival_months)) +
  geom_boxplot()
ggplot(data = df, aes(x = age_years, y = survival_months)) +
  geom_bin2d()
ggplot(data = df, aes(x = age_years, y = survival_months)) +
  geom_point()


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
       fill = "post surgery Therapy")
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
  labs(fill = NULL)
p1 / p2 / p3 / p4

#Plot per KPS e Surgery
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = surgery_biopsy0_resection1)) +
  geom_count()

p1 <- ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
             aes(x = KPS_less70.0._more70.1., fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Surgery Type")
p2 <- ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
             aes(x = KPS_less70.0._more70.1., fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2

#Plot per KPS e OS
ggplot(data = df, aes(color = KPS_less70.0._more70.1., x = survival_months)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, KPS_less70.0._more70.1. == "<70"),
             aes(fill = KPS_less70.0._more70.1., y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "<70",
       y = "OS in months",
       fill = "SVZ contact") +
  theme(legend.position = "none")
p2 <- ggplot(data = subset(df, KPS_less70.0._more70.1. == ">70"),
             aes(fill = KPS_less70.0._more70.1., y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = ">70",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p3 <- ggplot(data = subset(df, is.na(KPS_less70.0._more70.1.)),
             aes(fill = KPS_less70.0._more70.1., y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "NA",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p1 | p2 | p3

#Plot per KPS e Survived
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = survived_yes1_no0)) +
  geom_count()

p1 <- ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
             aes(x = KPS_less70.0._more70.1., fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Patient status")
p2 <- ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
             aes(x = KPS_less70.0._more70.1., fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2
#Plot per KPS e SVZ
ggplot(data = df, aes(x = KPS_less70.0._more70.1., y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
             aes(x = KPS_less70.0._more70.1., fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact")
p2 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
             aes(x = KPS_less70.0._more70.1., fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p3 <- ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
             aes(x = KPS_less70.0._more70.1., fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2 / p3

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
       fill = "post surgery Therapy")
p2 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
         aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
             fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 300)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2

#Plot per Therapy e OS
ggplot(data = df, aes(color = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, x = survival_months)) +
  geom_freqpoly()

p1 <- ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "None"),
             aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "None",
       y = "OS in months",
       fill = "SVZ contact") +
  theme(legend.position = "none")
p2 <- ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "Monotherapy"),
             aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "Monotherapy",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p3 <- ggplot(data = subset(df, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "RT+TMZ"),
             aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "RT+TMZ",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p4 <- ggplot(data = subset(df, is.na(post_surgery_therapy_none0_monotherapy1_RT.TMZ2)),
             aes(fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "NA",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p1 | p2 | p3 | p4

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
       fill = "Patient status")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
             aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
                 fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2

#Plot per Therapy e SVZ
ggplot(data = df, aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "No"),
             aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact")
p2 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
             aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p3 <- ggplot(data = subset(df, is.na(SVZ_status_nocontact0_contact1)),
             aes(x = post_surgery_therapy_none0_monotherapy1_RT.TMZ2, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = NULL)
p1 / p2 / p3


#--------------------------------2D Surgery-------------------------------------
#Plot per Surgery e OS
ggplot(data = df, aes(color = surgery_biopsy0_resection1, x = survival_months)) +
  geom_freqpoly()

p1 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Biopsy"),
             aes(fill = surgery_biopsy0_resection1, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35)) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "Biopsy",
       y = "OS in months",
       fill = "SVZ contact") +
  theme(legend.position = "none")
p2 <-
  ggplot(data = subset(df, surgery_biopsy0_resection1 == "Resection"),
             aes(fill = surgery_biopsy0_resection1, y = survival_months)) +
  geom_histogram(binwidth = 0.5) +
  scale_y_continuous(breaks = scales::breaks_width(5), limits = c(0, 35), labels = NULL) +
  scale_x_continuous(breaks = scales::breaks_width(10), limits = c(0, 60)) +
  labs(x = "Resection",
       y = NULL,
       fill = NULL) +
  theme(legend.position = "none")
p1 | p2

#Plot per Surgery e Survived
ggplot(data = df, aes(x = surgery_biopsy0_resection1, y = survived_yes1_no0)) +
  geom_count()

p1 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Dead"),
             aes(x = surgery_biopsy0_resection1, fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "Patient status")
p2 <-
  ggplot(data = subset(df, survived_yes1_no0 == "Alive"),
             aes(x = surgery_biopsy0_resection1, fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = "Surgery Type",
       fill = "Patient status")
p1 / p2

#Plot per Surgery e SVZ
ggplot(data = df, aes(x = surgery_biopsy0_resection1, y = SVZ_status_nocontact0_contact1)) +
  geom_count()

p1 <- ggplot(data = subset(df, SVZ_status_nocontact0_contact1 == "Yes"),
             aes(x = surgery_biopsy0_resection1, fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50), limits = c(0, 350)) +
  labs(x = NULL,
       fill = "SVZ contact")
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
p1 / p2 / p3

#--------------------------------2D OS------------------------------------------
#Plot per OS e Survived
ggplot(data = df, aes(x = survival_months, y = survived_yes1_no0)) +
  geom_count()

#Plot per OS e SVZ
ggplot(data = df, aes(x = survival_months, y = SVZ_status_nocontact0_contact1)) +
  geom_count()

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
       fill = "SVZ contact")
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
p1 / p2 / p3


#--------------------------------Bar plot per KPS-------------------------------
ggplot(data = df, aes(x = fct_infreq(KPS_less70.0._more70.1.),
                      fill = KPS_less70.0._more70.1.)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("KPS Level") +
  ylab("Count")

#--------------------------------Bar plot per Surgery--------------------------
ggplot(data = df, aes(x = fct_infreq(surgery_biopsy0_resection1),
                      fill = surgery_biopsy0_resection1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Surgery type") +
  ylab("Count")


#--------------------------------Bar plot per SVZ-------------------------------
ggplot(data = df, aes(x = fct_infreq(SVZ_status_nocontact0_contact1),
                      fill = SVZ_status_nocontact0_contact1)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("SVZ contact") +
  ylab("Count")


#--------------------------------Bar plot per Therapy---------------------------
ggplot(data = df, aes(x = fct_infreq(post_surgery_therapy_none0_monotherapy1_RT.TMZ2),
                      fill = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Post surgery Therapy") +
  ylab("Count")


#--------------------------------Bar plot per Survived--------------------------
ggplot(data = df, aes(x = fct_infreq(survived_yes1_no0),
                      fill = survived_yes1_no0)) +
  geom_bar() +
  scale_y_continuous(breaks = scales::breaks_width(width = 50)) +
  scale_fill_brewer(palette = "Accent", na.value = "red") +
  theme(legend.position = "none") +
  xlab("Patient status") +
  ylab("Count")


#--------------------------------Istogramma per Age-----------------------------
ggplot(data = df, aes(x = age_years)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = scales::breaks_width(10)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  theme(legend.position = "none") +
  xlab("Age in years") +
  ylab("Count")
ggplot(data = df, aes(x = age_years)) +
  geom_density()
ggplot(df, aes(age_years)) +
  geom_bar() +
  scale_x_binned(breaks = scales::breaks_width(5))

#--------------------------------Istogramma per Survival months-----------------
ggplot(data = df, aes(x = survival_months)) + geom_histogram(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(2)) +
  scale_y_continuous(breaks = scales::breaks_width(4)) +
  xlab("Survived months") +
  ylab("Count")
ggplot(data = df, aes(x = survival_months)) + geom_freqpoly(binwidth = 0.5) +
  scale_x_continuous(breaks = scales::breaks_width(5)) +
  scale_y_continuous(breaks = scales::breaks_width(2)) +
  xlab("Survived months") +
  ylab("Count")


ggpairs(df)
