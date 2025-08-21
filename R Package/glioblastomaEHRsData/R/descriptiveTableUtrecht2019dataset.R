#' @md
#' @title Descriptive statistic table for the utrecht2019dataset
#'
#' @description Function to create, display and optionally export a table containing descriptive statistics for the utrecht2019dataset\cr
#' The table is created using the table1 package and is grouped by survival status.
#'
#' @param savePath Character (optional). String specifying the path and filename for exporting the table.
#'  - If NULL (default), the table will not be exported.
#'  - If "" (empty string), the table will be saved in the working directory using a default name.
#'  - Expected format: 'filepath/filename.extensions' where:
#'    \itemize{
#'      \item filepath is the directory path, absolute or relative and must already exist;
#'      \item filename is the name of the file;
#'      \item extension must be one of 'png', or 'pdf',must exists unless using the default file name.
#'    }
#'
#' @return A 'table1' object containing descriptive statistics grouped by survival status.
#'
#' @seealso [table1::table1()]
#'
#' @examples
#' # Create and display the table, without saving anything
#' descriptiveTableUtrecht2019dataset()
#'
#' ## Not run:
#' # Create, display and save the table giving a path, filename and extension
#' descriptiveTableUtrecht2019dataset(savePath = "tables/utrecht_table.pdf")
#'
#' # Create, display and save the table giving only the path, default name will be used
#' descriptiveTableUtrecht2019dataset(savePath = "tables/")
#'
#' # Create, display and save the table giving a path and filename,default extension will be used
#' descriptiveTableUtrecht2019dataset(savePath = "tables/utrecht_table")
#'
#' ## End(Not run)
#'
#' @importFrom table1 table1
#' @export
descriptiveTableUtrecht2019dataset <- function(savePath = NULL){
  t1 <- table1(~ age_years +
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
  if(!is.null(savePath)) {
    status <- saveTable(t1,
                        names = c("Utrecht2019dataset") ,
                        savePath = savePath)
    if(status == -1)
      warning("Saving process interrupted, read the error above")
  }
  return(t1)
}
