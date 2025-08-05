#' @title descriptiveTableTainan2020dataset
#'
#' @description Function to create, display and optionally export a table containing descriptive statistics for the tainan2020dataset.\cr
#' The table is createtd using the table1 package and is grouped by survival status.
#'
#' @param savePath character string specifying the path and filename for exporting the table.
#'  If NULL (default), the table will not be exported.
#'
#'  Expected format: "filepath/filename.extension", extension can be svg, png, or pdf, the directory must exist beforehand.
#'
#' @return A 'table1' object containing descriptive statistics grouped by survival status.
#'
#' @examples
#' descriptiveTableTainan2020dataset()
#'
#' descriptiveTableTainan2020dataset(savePath = "tables/tainan_table.pdf")
#'
#' @importFrom table1 table1
#' @export
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
