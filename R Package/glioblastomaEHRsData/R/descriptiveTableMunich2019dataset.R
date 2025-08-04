#' @title descriptiveTableMunich2019dataset
#'
#' @description Function to create, display and optionally export a table containing descriptive statistics for munich2019dataset.\cr
#' The table is createtd using the table1 package and is grouped by survival status.
#'
#' @param savePath character string specifying the path and filename for exporting the table.\cr
#' If NULL (default), the table will not be exported.\cr
#' Expected format: "filepath/filename.extension", extension can be svg, png, or pdf, the directory must exist beforehand.
#'
#' @return A 'table1' object containing descriptive statistics grouped by survival status.
#'
#' @examples
#' descriptiveTableMunich2019dataset()
#'
#' descriptiveTableMunich2019dataset(savePath = "tables/munich_table.pdf")
#'
#' @importFrom table1 table1
#' @export
descriptiveTableMunich2019dataset <- function(savePath = NULL) {
  t1 <- table1(~ sex_male0_female1 +
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
  if(!is.null(savePath))
    status <- saveTable(t1,
                        names = c("Munich2019dataset"),
                        savePath = savePath)
  return(t1)
}
