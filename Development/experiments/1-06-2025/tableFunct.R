source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("table1", "flextable")

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
                year_of_diagnosis_05.10.0._10.16.1.
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
                post_surgery_therapy_none0_monotherapy1_RT.TMZ2 +
                survival_months +
                KPS_less70.0._more70.1. +
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
