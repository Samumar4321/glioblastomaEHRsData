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
              topclass = "Rtable1-shade",
              render.continuous = c( .= "Median [MIN - MAX]",
                                     .= "Mean (SD)",
                                     .= "Q1 - Q3"))
  ft1 <- t1flex(r)


  if(is.null(savePath) || savePath == "") {
    save_as_image(ft1, "defaultname.svg")
    print("primo")
  }
  else {
    has_file_name <- grepl("\\.", tolower(basename(savePath)))
    if(!has_file_name) {
      if(!dir.exists(savePath))
        dir.create(savePath)
      save_as_image(ft1, paste0(savePath, "/defaultname2.svg"))
      print("secondo")
    }
    else {
      if(!dir.exists(dirname(savePath)))
        dir.create(dirname(savePath))
      is_valid_format <- grepl("\\.(svg)$", tolower(basename(savePath)))
      if(!is_valid_format){
        stop("Valid format error: file exension must .svg")
      }
      else {
        save_as_image(ft1, savePath)
        print("terzo")
      }
    }
  }

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
  return(r)
}
