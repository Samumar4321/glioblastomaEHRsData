source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("table1")

munich2019dataset$sex_male0_female1 <- 
  factor(munich2019dataset$sex_male0_female1, 
         levels=c(0, 1),
         labels=c("Male", "Female"))

munich2019dataset$survived_yes1_no0 <-
  factor(munich2019dataset$survived_yes1_no0,
         levels = c(0,1),
         labels = c("Dead", "Alive"))

munich2019dataset$tumor_progression_yes1_no0 <- 
  factor(munich2019dataset$tumor_progression_yes1_no0,
         levels = c(0,1),
         labels = c("No", "Yes"))

munich2019dataset$MGMTmethylation_methylated1_unmethylated0 <- 
  factor(munich2019dataset$MGMTmethylation_methylated1_unmethylated0,
         levels = c(0, 1),
         labels = c("No", "Yes"))

munich2019dataset$cHsp70_low0_high1 <-
  factor(munich2019dataset$cHsp70_low0_high1,
         levels = c(0, 1),
         labels = c("Low", "High"))

label(munich2019dataset$sex_male0_female1) <- "Sex"
label(munich2019dataset$age_years) <- "Age (years)"
label(munich2019dataset$OS_months) <- "Overall Survival (months)"
label(munich2019dataset$survived_yes1_no0) <- "Alive"
label(munich2019dataset$PFS_months) <- "Progress Free Survival (months)"
label(munich2019dataset$tumor_progression_yes1_no0) <- "Tumor progression"
label(munich2019dataset$MGMTmethylation_methylated1_unmethylated0)  <- "MGMT Methylation"
label(munich2019dataset$cHsp70_low0_high1) <- "cHsp70 level"

males <- subset(munich2019dataset, sex_male0_female1 == "Male")
females <- subset(munich2019dataset, sex_male0_female1 == "Female")

strata <- c(split(males, males$survived_yes1_no0),
            list("Total" = subset(munich2019dataset, sex_male0_female1 == "Male")),
            split(females, females$survived_yes1_no0),
            list("Total" = subset(munich2019dataset, sex_male0_female1 == "Female")),
            list("Total" = munich2019dataset))

labels <- list(
  variables=list(age_years = render.varlabel(munich2019dataset$age_years),
                 OS_months = render.varlabel(munich2019dataset$OS_months),
                 PFS_months = render.varlabel(munich2019dataset$PFS_months),
                 tumor_progression_yes1_no0 = render.varlabel(munich2019dataset$tumor_progression_yes1_no0),
                 MGMTmethylation_methylated1_unmethylated0=render.varlabel(munich2019dataset$MGMTmethylation_methylated1_unmethylated0),
                 cHsp70_low0_high1=render.varlabel(munich2019dataset$cHsp70_low0_high1)),
  groups=list("Male", "Female", "Overall"))

rndr <- function(x, name, ...) {
  if (!is.numeric(x)) return(render.categorical.default(x))
  what <- switch(name,
                 age_years = c("Median [Min, Max]" = "Median [Min, Max]", 
                               "Mean (SD)" = "Mean (SD)"),
                 OS_months  = c(.= "Median [Min, Max]",
                                .= "Mean (SD)", 
                                .="Q1 - Q3"),
                 PFS_months = c(.= "Median [Min, Max]",
                                .= "Mean (SD)",
                                .= "Q1 - Q3"))
  parse.abbrev.render.code(c("", what))(x)
}

table1(strata, labels, groupspan=c(3, 3, 1), render = rndr, topclass = "Rtable1-shade")
