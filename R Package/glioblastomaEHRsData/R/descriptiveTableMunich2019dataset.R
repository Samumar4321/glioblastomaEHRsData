#' @md
#' @title Descriptive statistics table for the munich2019dataset
#'
#' @description Function to create, display and optionally export a table
#' containing descriptive statistics for the munich2019dataset.\cr
#' The table is created using the table1 package and is grouped by survival status.
#'
#' @param savePath Character (optional). String specifying the path and filename
#' for exporting the table.
#'  - If NULL (default), the table will not be exported.
#'  - If "" (empty string), the table will be saved in the working directory
#'    using a default name.
#'  - Expected format: 'filepath/filename.extensions' where:
#'    - filepath is the directory (must already exist), default is the working directory;
#'    - filename is the name of the file, default to 'table_munich2019dataset_timestamp.png';
#'    - extension must be one of png or pdf and must be specified, unless using the default filename.
#'
#' @return A 'table1' object containing descriptive statistics grouped by survival status.
#'
#' @seealso [table1::table1()]
#'
#' @examples
#' # Create and display the table, without saving anything
#' descriptiveTableMunich2019dataset()
#'
#' \donttest{
#' # Create, display and save the table giving a path, filename and extension
#' descriptiveTableMunich2019dataset(savePath = "tables/munich_table.pdf")
#'
#' # Create, display and save the table giving only the path, default name will be used
#' descriptiveTableMunich2019dataset(savePath = "tables/")
#'
#' # Create, display and save the table giving a path and filename, default extension will be used
#' descriptiveTableMunich2019dataset(savePath = "tables/munich_table")
#' }
#'
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
  if(!is.null(savePath)) {
    status <- saveTable(t1,
                        names = c("Munich2019dataset"),
                        savePath = savePath)
    if(status != 0)
      warning(sprintf("Saving process interrupted: %s", status))
  }
  return(t1)
}
