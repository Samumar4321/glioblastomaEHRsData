library(boot) 
library(pacman)
p_load(table1, readxl)

munichdataset <- read_excel("C:/Users/Samuele/Downloads/Lammer.xlsx", 
                            col_types = c("numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", "numeric", 
                                          "numeric", "numeric"))
View(munichdataset)

munichdataset$sex_male0_female1 <- 
  factor(munichdataset$sex_male0_female1, 
         levels=c(0, 1),
         labels=c("Male", "Female"))

munichdataset$survived_yes1_no0 <-
  factor(munichdataset$survived_yes1_no0,
         levels = c(0,1),
         labels = c("Dead", "Alive"))

munichdataset$tumor_progression_yes1_no0 <- 
  factor(munichdataset$tumor_progression_yes1_no0,
         levels = c(0,1),
         labels = c("No", "Yes"))

munichdataset$MGMTmethylation_methylated1_unmethylated0 <- 
  factor(munichdataset$MGMTmethylation_methylated1_unmethylated0,
         levels = c(0, 1),
         labels = c("No", "Yes"))

munichdataset$cHsp70_low0_high1 <-
  factor(munichdataset$cHsp70_low0_high1,
         levels = c(0, 1),
         labels = c("Low", "High"))

label(munichdataset$sex_male0_female1) <- "Sex"
label(munichdataset$age_years) <- "Age (years)"
label(munichdataset$OS_months) <- "Overall Survival (months)"
label(munichdataset$survived_yes1_no0) <- "Alive"
label(munichdataset$PFS_months) <- "Progress Free Survival (months)"
label(munichdataset$tumor_progression_yes1_no0) <- "Tumor progression"
label(munichdataset$MGMTmethylation_methylated1_unmethylated0)  <- "MGMT Methylation"
label(munichdataset$cHsp70_low0_high1) <- "cHsp70 level"

#tabella classica, con classificazione prima per sesso e poi per sopravvivenza
table1(~ age_years + 
         OS_months + 
         PFS_months + 
         tumor_progression_yes1_no0 + 
         MGMTmethylation_methylated1_unmethylated0 + 
         cHsp70_low0_high1 | 
         survived_yes1_no0 *
         sex_male0_female1, data=munichdataset)


males <- subset(munichdataset, sex_male0_female1 == "Male")
females <- subset(munichdataset, sex_male0_female1 == "Female")

strata <- c(split(males, males$survived_yes1_no0),
            list("Total" = subset(munichdataset, sex_male0_female1 == "Male")),
            split(females, females$survived_yes1_no0),
            list("Total" = subset(munichdataset, sex_male0_female1 == "Female")),
            list("Total" = munichdataset))

labels <- list(
  variables=list(age_years = render.varlabel(munichdataset$age_years),
                 OS_months = render.varlabel(munichdataset$OS_months),
                 PFS_months = render.varlabel(munichdataset$PFS_months),
                 tumor_progression_yes1_no0 = render.varlabel(munichdataset$tumor_progression_yes1_no0),
                 MGMTmethylation_methylated1_unmethylated0=render.varlabel(munichdataset$MGMTmethylation_methylated1_unmethylated0),
                 cHsp70_low0_high1=render.varlabel(munichdataset$cHsp70_low0_high1)),
  groups=list("Male", "Female", "Overall"))

#stessa tabella di prima, con aggiunto il parametro Total, che calcola i dati anche sul totale delle sotto categorie
table1(strata, labels, groupspan=c(3, 3, 1), topclass = "Rtable1-shade")