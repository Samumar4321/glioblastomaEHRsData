#' @md
#' @title Descriptive statistic table for the tainan2020dataset
#'
#' @description Function to create, display and optionally export a table containing descriptive statistics for the tainan2020dataset.\cr
#' The table is created using the table1 package and is grouped by survival status.
#'
#' @param savePath Character (optional). String specifying the path and filename for exporting the table.
#'  - If NULL (default), the table will not be exported.
#'  - If "" (empty string), the table will be saved in the working directory using a default name.
#'  - Expected format: 'filepath/filename.extensions' where:
#'    \itemize{
#'      \item filepath is the directory path, absolute or relative and must already exist;
#'      \item filename is the name of the file;
#'      \item extension must be one of 'svg', 'png', or 'pdf', must exists unless using the default file name.
#'    }
#'
#' @return A 'table1' object containing descriptive statistics grouped by survival status.
#'
#' @seealso [table1::table1()]
#'
#' @examples
#' # Create and display the table, without saving anything
#' descriptiveTableTainan2020dataset()
#'
#' ## Not run:
#' # Create, display and save the table giving a path, filename and extension
#' descriptiveTableTainan2020dataset(savePath = "tables/tainan_table.pdf")
#'
#' # Create, display and save the table giving only the path, default name will be used
#' descriptiveTableTainan2020dataset(savePath = "tables/")
#'
#' # Create, display and save the table giving a path and filename,default extension will be used
#' descriptiveTableTainan2020dataset(savePath = "tables/tainan_table")
#'
#' ## End(Not run)
#'
#' @importFrom table1 table1
#' @export
descriptiveTableTainan2020dataset <- function(savePath = NULL) {
  t1 <- table1(~ sex_male0_female1 +
                age_years +
                OS_months +
                PFS_months +
                tumorProgression_no0_yes1 +
                surgery_resection1_biopsy0 +
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
  if(!is.null(savePath)) {
    status <- saveTable(t1,
                        names = c("Tainan2020dataset"),
                        savePath = savePath)
    if(status == -1)
      warning("Saving process interrupted, read the error above")
  }

  return(t1)
}
