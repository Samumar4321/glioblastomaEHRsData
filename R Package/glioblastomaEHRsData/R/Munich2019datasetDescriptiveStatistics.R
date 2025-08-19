#' @md
#' @title Munich2019datasetDescriptiveStatistics
#'
#' @description Provides descriptive statistics for the 'munich2019dataset'.
#'  It can display summary statistic for continuous variables, frequency tables for categorical variables
#'  or both.
#'
#'
#' @param show character string for the type of statistic to show.
#'  There are three options:
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
#'   }
#'
#' @seealso [summarytools::descr()], [summarytools::freq()]
#'
#' @examples
#'   # Show both continuous and categorical stats
#'   all <- Munich2019datasetDescriptiveStatistics(show = "all")
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
#'   cont <- Munich2019datasetDescriptiveStatistics("continuous")
#'
#'   # Statistics for age_years column
#'   cont[, "age_years"]
#'
#'   # Only categorical variables
#'   cat <- Munich2019datasetDescriptiveStatistics("categorical")
#'
#'   # Frequency values for all factors of the first categorical column
#'   cat[[1]][,"Freq"]
#'
#'   # Statistics for the Low factor of the first categorical column
#'   cat[[1]]["Low",]
#'
#'   # Frequency of the Low factor, a value of the first categorical column
#'   cat[[1]]["Low", "Freq"]
#'
#' @importFrom summarytools descr freq
#' @export
Munich2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(munich2019dataset),
                   "categorical" = summarytools::freq(munich2019dataset),
                   "all" = list(continuous = summarytools::descr(munich2019dataset),
                                categorical = summarytools::freq(munich2019dataset)),
                   stop("Invalid 'show' value, use one of 'all', 'categorical' or 'continuous'."))
  return(result)
}
