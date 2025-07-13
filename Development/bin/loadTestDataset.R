library("pacman")
p_load("tidyverse", "table1", "summarytools", "DataExplorer", "dyplr", "ggplot2", "flextable")

# READ --------------
munich2019dataset <- read.csv("../../Development/datasets/Munich2019dataset.csv",
                              colClasses = c(
                                "cHsp70_low0_high1" = "character",
                                "sex_male0_female1" = "character",
                                "survived_yes1_no0" = "character",
                                "tumor_progression_yes1_no0" = "character",
                                "MGMTmethylation_methylated1_unmethylated0" = "character",
                                "tumor_progression_yes1_no0" = "character"
                              ))
tainan2020dataset <- read.csv("../../Development/datasets/Tainan2020dataset.csv",
                              colClasses = c(
                                "chemo_yes1_no0" = "character",
                                "sex_male0_female1" = "character",
                                "surgery_yes1_biopsy0" = "character",
                                "survived_yes1_no0" = "character",
                                "TMZ_based_chemo_yes1_no0" = "character",
                                "tumorProgression_no0_yes1" = "character",
                                "year_of_diagnosis_05to10_0_10to16_1" = "character"
                              ))
utrecht2019dataset <- read.csv("../../Development/datasets/Utrecht2019dataset.csv",
                               colClasses = c(
                                 "KPS_less70.0_more70.1" = "character",
                                 "post_surgery_therapy_none0_monotherapy1_RTandTMZ2" = "character",
                                 "surgery_biopsy0_resection1" = "character",
                                 "survived_yes1_no0" = "character",
                                 "SVZ_status_nocontact0_contact1" = "character"
                               ))

# MUNICH REFACTOR ------------
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
# TAINAN REFACTOR -------------
tainan2020dataset$chemo_yes1_no0 <-
  factor(tainan2020dataset$chemo_yes1_no0,
         levels = c(0, 1),
         labels = c("No", "Yes"))
tainan2020dataset$sex_male0_female1 <-
  factor(tainan2020dataset$sex_male0_female1,
         levels = c(0, 1),
         labels = c("Male", "Female"))
tainan2020dataset$surgery_yes1_biopsy0 <-
  factor(tainan2020dataset$surgery_yes1_biopsy0,
         levels = c(0, 1),
         labels = c("Biopsy", "Yes"))
tainan2020dataset$survived_yes1_no0 <-
  factor(tainan2020dataset$survived_yes1_no0,
         levels = c(0, 1),
         labels = c("Dead", "Alive"))
tainan2020dataset$TMZ_based_chemo_yes1_no0 <-
  factor(tainan2020dataset$TMZ_based_chemo_yes1_no0,
         levels = c(0, 1),
         labels = c("No", "Yes"))
tainan2020dataset$tumorProgression_no0_yes1 <-
  factor(tainan2020dataset$tumorProgression_no0_yes1,
         levels = c(0, 1),
         labels = c("No", "Yes"))
tainan2020dataset$year_of_diagnosis_05to10_0_10to16_1 <-
  factor(tainan2020dataset$year_of_diagnosis_05to10_0_10to16_1,
         levels = c(0, 1),
         labels = c("2005-2010", "2010-2016"))

label(tainan2020dataset$age_years) <- "Age (years)"
label(tainan2020dataset$chemo_yes1_no0) <- "Chemotherapy"
label(tainan2020dataset$OS_months) <- "Overall Survival (months)"
label(tainan2020dataset$PFS_months) <- "Progression Free Survival (months)"
label(tainan2020dataset$radiation_dose_Gy) <- "Radiation dose (Gy)"
label(tainan2020dataset$radiation_volume_mL) <- "Radiation volume (mL)"
label(tainan2020dataset$sex_male0_female1) <- "Sex"
label(tainan2020dataset$surgery_yes1_biopsy0) <- "Surgery"
label(tainan2020dataset$survived_yes1_no0) <- "Patient status"
label(tainan2020dataset$TMZ_based_chemo_yes1_no0) <- "TMZ chemotherapy"
label(tainan2020dataset$tumorProgression_no0_yes1) <- "Tumor progression"
label(tainan2020dataset$year_of_diagnosis_05to10_0_10to16_1) <- "Year of diagnosis"
# UTRECHT REFACTPR -------------
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

# ----

#STATS
Municht2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(munich2019dataset),
                   "categorical" = summarytools::freq(munich2019dataset),
                   "all" = list(summarytools::descr(munich2019dataset),
                                summarytools::freq(munich2019dataset)))
  return(result)
}

Tainan2020datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(tainan2020dataset),
                   "categorical" = summarytools::freq(tainan2020dataset),
                   "all" = list(summarytools::descr(tainan2020dataset),
                                summarytools::freq(tainan2020dataset)))
  return(result)
}

Utrecht2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(utrecht2019dataset),
                   "categorical" = summarytools::freq(utrecht2019dataset),
                   "all" = list(summarytools::descr(utrecht2019dataset),
                                summarytools::freq(utrecht2019dataset)))
  return(result)
}

#TABLES
descriptiveTableMunich2019dataset <- function(savePath = NULL) {
  r <- table1(~ sex_male0_female1 +
                age_years +
                OS_months +
                PFS_months +
                tumor_progression_yes1_no0 +
                MGMTmethylation_methylated1_unmethylated0 +
                cHsp70_low0_high1 |
                survived_yes1_no0,
              data = munich2019dataset,
              caption = "Munich2019dataset",
              topclass = "Rtable1-shade",
              render.continuous = c( .= "Median [MIN - MAX]",
                                     .= "Mean (SD)",
                                     .= "Q1 - Q3"))
  status <- saveTable(r,
                      names = c("Munich2019datase"),
                      savePath = savePath)
  return(r)
}

descriptiveTableTainan2020dataset <- function(savePath = NULL) {
  r <- table1(~ sex_male0_female1 +
                age_years +
                OS_months +
                PFS_months +
                tumorProgression_no0_yes1 +
                surgery_yes1_biopsy0 +
                chemo_yes1_no0 +
                TMZ_based_chemo_yes1_no0 +
                radiation_dose_Gy +
                radiation_volume_mL +
                year_of_diagnosis_05to10_0_10to16_1
              |
                survived_yes1_no0,
              data = tainan2020dataset,
              topclass = "Rtable1-shade",
              render.continuous = c(.= "Median [MIN - MAX]",
                                    .= "Mean (SD)",
                                    .= "Q1 - Q3"))
  status <- saveTable(r,
                      names = c("Tainan2020dataset"),
                      savePath = savePath)
  return(r)
}

descriptiveTableUtrecht2019dataset <- function(savePath = NULL){
  r <- table1(~ age_years +
                post_surgery_therapy_none0_monotherapy1_RTandTMZ2 +
                OS_months +
                KPS_less70.0_more70.1 +
                surgery_biopsy0_resection1 +
                SVZ_status_nocontact0_contact1 |
                survived_yes1_no0,
              data = utrecht2019dataset,
              topclass = "Rtable1-shade",
              render.continuous = c(.= "Median [Min, Max]",
                                    .= "Mean (SD)",
                                    .= "Q1 - Q3"))
  status <- saveTable(r,
                      names = c("Utrecht2019dataset") ,
                      savePath = savePath)
  return(r)
}

saveTable <- function(t1, names, savePath = NULL) {
  dataset <- names[1]
  if(is.na(dataset)) {
    stop("Dataset not named")
  }
  default_name <- paste0(paste("table",
                               dataset,
                               Sys.Date(),
                               format(Sys.time(), "%Hh%Mm%Ss"),
                               sep = "_"),
                         ".svg")

  if(is.null(savePath) || savePath == "") {
    save_as_image(t1flex(t1), default_name)
    return(0)
  }
  else {
    has_filename <- grepl("\\.", basename(savePath))
    if(has_filename){
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(dirname(savePath))){
        stop("Specified directory does not exists")
        return(-1)
      }
      #CONTROLLA CHE ABBIA GIUSTA ESTENSIONE
      if(!grepl("\\.(svg|pdf|png)$", basename(savePath))) {
        stop("File of invalid format, use .svg, .png or .pdf instead")
        return(-1)
      }
      #SALVA CON FILENAME UTENTE
      if(grepl("\\.(pdf)$", basename(savePath))) {
        cat('
---
output: pdf_document
---

```{r show-flextable, echo=FALSE, result="asis"}
t1
```
', file = "table1.Rmd")
        rmarkdown::render("table1.Rmd", output_file = savePath)
        file.remove("table1.Rmd")
        return(0)
      }
      save_as_image(t1flex(t1), savePath)
      return(0)
    }
    else{
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(savePath)) {
        stop("Specified directory does not exists")
        return(-1)
      }
      #SALVA NELLA DIR CON DEFAULTNAME
      save_as_image(t1flex(t1), paste0(savePath, "/", default_name))
      return(0)
    }
  }
}

#PLOTS
plotMunich2019dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(munich2019dataset))) {
    stop(paste("La variabile", name1, "non è presente nel dataset."))
  }
  if (!is.na(name2) && !(name2 %in% names(munich2019dataset))) {
    stop(paste("La variabile", name2, "non è presente nel dataset."))
  }

  if(is.na(name2)) {
    if(is.numeric(munich2019dataset[[name1]]) || is.integer(munich2019dataset[[name1]])) {
      plot <- plot_histogram(munich2019dataset[[name1]])[[1]] +
        labs(x = name1)
    }
    else if(is.character(munich2019dataset[[name1]]) || is.factor(munich2019dataset[[name1]])){
      plot <- plot_bar(munich2019dataset[[name1]])[[1]] +
        labs(x = name1)
    }
  } else {
    if(is.numeric(munich2019dataset[[name1]]) || is.integer(munich2019dataset[[name1]])) {
      plot <- plot_boxplot(munich2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
    else if(is.numeric(munich2019dataset[[name2]]) || is.integer(munich2019dataset[[name2]])){
      plot <- plot_boxplot(munich2019dataset[, c(name1, name2)], by = name1)[[1]]
    }
    else{
      plot <- plot_bar(munich2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
  }

  savePlot(plot,
           names = c("Munich2019datset", name1, name2),
           savePath = savePath)
  return(plot)
}

plotTainan2020dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(tainan2020dataset))) {
    stop(paste("La variabile", name1, "non è presente nel dataset."))
  }
  if (!is.na(name2) && !(name2 %in% names(tainan2020dataset))) {
    stop(paste("La variabile", name2, "non è presente nel dataset."))
  }

  if(is.na(name2)) {
    if(is.numeric(tainan2020dataset[[name1]]) || is.integer(tainan2020dataset[[name1]])) {
      plot <- plot_histogram(tainan2020dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(tainan2020dataset[[name1]]) || is.factor(tainan2020dataset[[name1]])){
      plot <- plot_bar(tainan2020dataset[[name1]])[[1]] + labs(x = name1)
    }
  } else {
    if(is.numeric(tainan2020dataset[[name1]]) || is.integer(tainan2020dataset[[name1]])) {
      plot <- plot_boxplot(tainan2020dataset[, c(name1, name2)], by = name2)[[1]]
    }
    else if(is.numeric(tainan2020dataset[[name2]]) || is.integer(tainan2020dataset[[name2]])){
      plot <- plot_boxplot(tainan2020dataset[, c(name1, name2)], by = name1)[[1]]
    }
    else{
      plot <- plot_bar(tainan2020dataset[, c(name1, name2)], by = name2)[[1]]
    }
  }

  savePlot(plot,
           names = c("Tainan2020dataset", name1, name2),
           savePath = savePath)
  return(plot)
}

plotUtrecht2019dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(utrecht2019dataset))) {
    stop(paste("La variabile", name1, "non è presente nel dataset."))
  }
  if (!is.na(name2) && !(name2 %in% names(utrecht2019dataset))) {
    stop(paste("La variabile", name2, "non è presente nel dataset."))
  }

  if(is.na(name2)) {
    if(is.numeric(utrecht2019dataset[[name1]]) || is.integer(utrecht2019dataset[[name1]])) {
      plot <- plot_histogram(utrecht2019dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(utrecht2019dataset[[name1]]) || is.factor(utrecht2019dataset[[name1]])){
      plot <- plot_bar(utrecht2019dataset[[name1]])[[1]] + labs(x = name1)
    }
  }
  else{
    if(is.numeric(utrecht2019dataset[[name1]]) || is.integer(utrecht2019dataset[[name1]])) {
      plot <- plot_boxplot(utrecht2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
    else if(is.numeric(utrecht2019dataset[[name2]]) || is.integer(utrecht2019dataset[[name2]])){
      plot <- plot_boxplot(utrecht2019dataset[, c(name1, name2)], by = name1)[[1]]
    }
    else{
      plot <- plot_bar(utrecht2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
  }

  savePlot(plot,
           names = c("Utrecht2019dataset", name1, name2),
           savePath = savePath)
  return(plot)
}

savePlot <- function(p, names, savePath = NA) {
  dataset <- names[1]
  arg1 <- names[2]
  arg2 <- names[3]
  if(is.na(arg2)) {
    default_name <- paste0(paste("plot",
                                 dataset,
                                 arg1,
                                 Sys.Date(),
                                 format(Sys.time(), "%Hh%Mm%Ss"),
                                 sep = "_"),
                           ".png")
  } else {
    default_name <- paste0(paste("plot",
                                 dataset,
                                 arg1,
                                 arg2,
                                 Sys.Date(),
                                 format(Sys.time(), "%Hh%Mm%Ss"),
                                 sep = "_"),
                           ".png")
  }

  if(is.na(savePath) || savePath == "") {
    #SAVE CON DEFAULT NAME
    ggsave(filename = default_name, plot = p)
    return(0)
  }
  else {
    has_filename <- grepl("\\.", basename(savePath))
    if(has_filename){
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(dirname(savePath))){
        stop("Specified directory does not exists")
        return(-1)
      }
      #SALVA CON FILENAME UTENTE
      ggsave(path = dirname(savePath), filename = basename(savePath), plot = p)
      return(0)
    }
    else{
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(savePath)) {
        stop("Specified directory does not exists")
        return(-1)
      }
      #SALVA NELLA DIR CON DEFAULTNAME
      ggsave(path = savePath, filename = default_name, plot = p)
      return(0)
    }
  }
}
