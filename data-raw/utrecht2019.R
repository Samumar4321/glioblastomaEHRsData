library(pacman)
p_load(table1)

utrecht2019dataset <- read.csv("data-raw/Utrecht2019dataset.csv",
                               colClasses = c(
                                 "KPS_less70.0_more70.1" = "character",
                                 "post_surgery_therapy_none0_monotherapy1_RTandTMZ2" = "character",
                                 "surgery_biopsy0_resection1" = "character",
                                 "survived_yes1_no0" = "character",
                                 "SVZ_status_nocontact0_contact1" = "character"
                               ))

utrecht2019dataset$KPS_less70.0_more70.1 <-
  factor(utrecht2019dataset$KPS_less70.0_more70.1,
         levels = c(0,1),
         labels = c("<70", ">70"))
utrecht2019dataset$post_surgery_therapy_none0_monotherapy1_RTandTMZ2 <-
  factor(utrecht2019dataset$post_surgery_therapy_none0_monotherapy1_RTandTMZ2,
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
label(utrecht2019dataset$KPS_less70.0_more70.1) <- "KPS level"
label(utrecht2019dataset$post_surgery_therapy_none0_monotherapy1_RTandTMZ2) <- "Post surgery therapy"
label(utrecht2019dataset$surgery_biopsy0_resection1) <- "Surgery"
label(utrecht2019dataset$OS_months) <- "OS (months)"
label(utrecht2019dataset$survived_yes1_no0) <- "Patient status"
label(utrecht2019dataset$SVZ_status_nocontact0_contact1) <- "SVZ contact"

usethis::use_data(utrecht2019dataset, overwrite = TRUE)
