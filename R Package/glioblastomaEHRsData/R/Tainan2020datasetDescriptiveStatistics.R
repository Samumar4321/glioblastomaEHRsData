#' @title Tainan2020datasetDescriptiveStatistics
#'
#' @description Provides descriptive statistics for the 'tainan2020dataset'
#'
#' @param show character string for the type of statistic to show.
#'  There are three options:
#'
#'  If 'continuous', summary statistic for continuous variables will be displayed.
#'
#'  If 'categorical', summary statistic for categorical variables will be displayed.
#'
#'  If 'all', both summary will be displayed.
#'
#'  If none of the above an error will be launched.
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
#' @examples
#'   # Show both continuous and categorical statistics
#'   Tainan2020datasetDescriptiveStatistics(show = "all")
#'
#'   # Only continuous variables
#'   Tainan2020datasetDescriptiveStatistics("continuous")
#'
#'   # Only categorical variables
#'   Tainan2020datasetDescriptiveStatistics(show = "categorical")
#'
#' @importFrom summarytools descr freq
#' @export
Tainan2020datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(tainan2020dataset),
                   "categorical" = summarytools::freq(tainan2020dataset),
                   "all" = list(summarytools::descr(tainan2020dataset),
                                summarytools::freq(tainan2020dataset)),
                   stop("Invalid 'show' value, use one of 'all', 'categorical' or 'continuous'."))
  return(result)
}
