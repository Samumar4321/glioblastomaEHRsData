#' @title Municht2019datasetDescriptiveStatistics
#'
#' @description Provides descriptive statistics for the 'munich2019dataset'
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
#'   # Show both continuous and categorical stats
#'   Municht2019datasetDescriptiveStatistics(show = "all")
#'
#'   # Only continuous variables
#'   Municht2019datasetDescriptiveStatistics("continuous")
#'
#'   # Only categorical variables
#'   Municht2019datasetDescriptiveStatistics("categorical")
#'
#' @importFrom summarytools descr freq
#' @export
Municht2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(munich2019dataset),
                   "categorical" = summarytools::freq(munich2019dataset),
                   "all" = list(summarytools::descr(munich2019dataset),
                                summarytools::freq(munich2019dataset)),
                   stop("Invalid 'show' value, use one of 'all', 'categorical' or 'continuous'."))
  return(result)
}
