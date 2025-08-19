#' @md
#' @title Utrecht2019datasetDescriptiveStatistics
#'
#' @description Provides descriptive statistics for the 'utrecht2019dataset'.
#'  It can display summary statistic for continuous variables, frequency tables for categorical variables
#'  or both.
#'
#' @param show character string for the type of statistic to show.
#'   There are three options:
#'  - 'continuous', summary statistic for continuous variables will be displayed.
#'  - 'categorical', frequency tables for categorical variables will be displayed.
#'  - 'all', both summary will be displayed.
#'  - none of the above an error will be launched.
#'
#'@return A list or an object depending on the value of \code{show}:
#'   \describe{
#'     \item{If \code{show = "continuous"}}{A data frame with descriptive statistics.}
#'     \item{If \code{show = "categorical"}}{A list of frequency tables.}
#'     \item{If \code{show = "all"}}{A list of 2 items,
#'     the first is a data frame for continuous variable,
#'     the second is a list for categorical variables.}
#'     }
#'
#' @seealso [summarytools::descr()], [summarytools::freq()]
#'
#' @examples
#'   # Show both continuous and categorical stats
#'   all <- Utrecht2019datasetDescriptiveStatistics(show = "all")
#'
#'   # Mean value for the OS_months columns
#'   all$continuous["Mean", "OS_months"]
#'
#'   # Min, Median and Max value for ALL the numeric columns
#'   all$continuous[c("Min","Median","Max"),]
#'
#'   # Get the frequency table of the third categorical column
#'   all$categorical[[3]]
#'
#'   # Only continuous variables
#'   cont <- Utrecht2019datasetDescriptiveStatistics("continuous")
#'
#'   # Statistics for age_years column
#'   cont[, "age_years"]
#'
#'   # Only categorical variables
#'   cat <- Utrecht2019datasetDescriptiveStatistics("categorical")
#'
#'   # Frequency values for all factors of the second categorical column
#'   cat[[2]][,"Freq"]
#'
#'   # Statistics for the Yes factor of the second categorical column
#'   cat[[2]]["Monotherapy",]
#'
#'   # Frequency of the No factor, a value of the second categorical column
#'   cat[[2]]["RT+TMZ", "Freq"]
#'
#' @importFrom summarytools descr freq
#' @export
Utrecht2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(utrecht2019dataset),
                   "categorical" = summarytools::freq(utrecht2019dataset),
                   "all" = list(continuous = summarytools::descr(utrecht2019dataset),
                                categorical = summarytools::freq(utrecht2019dataset)),
                   stop("Invalid 'show' value, use one of 'all', 'categorical' or 'continuous'."))

  return(result)
}
