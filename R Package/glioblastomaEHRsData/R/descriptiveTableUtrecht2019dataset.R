#' @title descriptiveTableUtrecht2019dataset
#'
#' @description Function to create, display and optionally export a table containing descriptive statistics for the utrecht2019dataset\cr
#' The table is createtd using the table1 package and is grouped by survival status.
#'
#' @param savePath character string specifying the path and filename for exporting the table.
#'  If NULL (default), the table will not be exported.\cr
#'  Expected format:'filepath/filename.extensions, extensions can be one of svg, png or pdf, filepath must exist beforehand.
#'
#' @return A 'table1' object containing descriptive statistics grouped by survival status.
#'
#' @examples
#' descriptiveTableUtrecht2019dataset()
#'
#' descriptiveTableUtrecht2019dataset(savePath = "tables/utrecht_table.pdf")
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
  if(!is.null(savePath))
    status <- saveTable(t1,
                        names = c("Utrecht2019dataset") ,
                        savePath = savePath)
  return(t1)
}
