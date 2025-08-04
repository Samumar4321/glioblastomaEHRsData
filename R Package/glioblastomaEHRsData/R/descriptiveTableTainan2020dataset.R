






descriptiveTableTainan2020dataset <- function(savePath = NULL) {
  t1 <- table1(~ sex_male0_female1 +
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
  if(!is.null(savePath))
    status <- saveTable(t1,
                        names = c("Tainan2020dataset"),
                        savePath = savePath)
  return(t1)
}
