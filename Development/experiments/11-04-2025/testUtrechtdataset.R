source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("table1", "tidyverse")

testdataset <- utrecht2019dataset

testdataset$KPS_less70.0._more70.1. <-
  factor(testdataset$KPS_less70.0._more70.1.,
        levels = c(0,1),
        labels = c("<70", ">70"))
testdataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2 <-
  factor(testdataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2,
         levels = c(0, 1, 2),
         labels = c("None", "Monotherapy", "RT+TMZ"))
testdataset$surgery_biopsy0_resection1 <-
  factor(testdataset$surgery_biopsy0_resection1,
         levels = c(0, 1),
         labels = c("Biopsy", "Reselection"))
testdataset$survived_yes1_no0 <-
  factor(testdataset$survived_yes1_no0,
         levels = c(0, 1),
         labels = c("Dead","Alive"))
testdataset$SVZ_status_nocontact0_contact1 <-
  factor(testdataset$SVZ_status_nocontact0_contact1,
         levels = c(0, 1),
         labels = c("No","Yes"))

label(testdataset$age_years) <- "Age (years)"
label(testdataset$KPS_less70.0._more70.1.) <- "KPS level"
label(testdataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2) <- "Post surgery therapy"
label(testdataset$surgery_biopsy0_resection1) <- "Surgery"
label(testdataset$survival_months) <- "OS (months)"
label(testdataset$survived_yes1_no0) <- "Patient status"
label(testdataset$SVZ_status_nocontact0_contact1) <- "SVZ contact"

no_therapy <- subset(testdataset, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "None")
mono_therapy <- subset(testdataset, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "Monotherapy")
dual_therapy <- subset(testdataset, post_surgery_therapy_none0_monotherapy1_RT.TMZ2 == "RT+TMZ")
missing_therapy <- subset(testdataset, is.na(post_surgery_therapy_none0_monotherapy1_RT.TMZ2))

strata <- c(list("None" = no_therapy),
            list("Mono" = mono_therapy),
            list("RT+TMZ" = dual_therapy),
            list("Missing" = missing_therapy),
            list("Total" = testdataset))

labels <- list(
  variables=list(age_years = render.varlabel(testdataset$age_years),
                 survival_months = render.varlabel(testdataset$survival_months),
                 KPS_less70.0._more70.1. = render.varlabel(testdataset$KPS_less70.0._more70.1.),
                 surgery_biopsy0_resection1 = render.varlabel(testdataset$surgery_biopsy0_resection1),
                 survived_yes1_no0=render.varlabel(testdataset$survived_yes1_no0),
                 SVZ_status_nocontact0_contact1 = render.varlabel(testdataset$SVZ_status_nocontact0_contact1)),
  groups=list("Therapy", ""))

t1 <- table1(strata, labels, groupspan = c(4,1), topclass = "Rtable1-shade", render.continuous = c(.= "Median [Min, Max]",
                                                                                                   .= "Mean (SD)",
                                                                                                   .= "Q1 - Q3"))
labels <- list(
  variables = list(age_years = render.varlabel(testdataset$age_years),
               post_surgery_therapy_none0_monotherapy1_RT.TMZ2 = render.varlabel(testdataset$post_surgery_therapy_none0_monotherapy1_RT.TMZ2),
               survival_months = render.varlabel(testdataset$survival_months),
               KPS_less70.0._more70.1. = render.varlabel(testdataset$KPS_less70.0._more70.1.),
               surgery_biopsy0_resection1 = render.varlabel(testdataset$surgery_biopsy0_resection1),
               survived_yes1_no0=render.varlabel(testdataset$survived_yes1_no0),
               SVZ_status_nocontact0_contact1 = render.varlabel(testdataset$SVZ_status_nocontact0_contact1)),
  groups = list("Total"))

t2 <- table1(~ age_years +
               post_surgery_therapy_none0_monotherapy1_RT.TMZ2 +
               survival_months +
               KPS_less70.0._more70.1. +
               surgery_biopsy0_resection1 +
               survived_yes1_no0 +
               SVZ_status_nocontact0_contact1,
             data = testdataset,
             topclass = "Rtable1-shade",
             render.continuous = c(.= "Median [Min, Max]",
                                   .= "Mean (SD)",
                                   .= "Q1 - Q3"))

t3 <- table1(~ age_years +
               post_surgery_therapy_none0_monotherapy1_RT.TMZ2 +
               survival_months +
               KPS_less70.0._more70.1. +
               surgery_biopsy0_resection1 +
               SVZ_status_nocontact0_contact1 |
               survived_yes1_no0,
             data = testdataset,
             topclass = "Rtable1-shade",
             render.continuous = c(.= "Median [Min, Max]",
                                   .= "Mean (SD)",
                                   .= "Q1 - Q3"))
