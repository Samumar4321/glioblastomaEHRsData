#' @title Tainan2020datasetDescriptiveStatistics
#'
#' @description Provides descriptive statistics for the 'tainan2020dataset'
#'
#' @param show character string for the type of statistic to show
#'    \describe{
#'      \item{"continuous"}{Summary statistics for continuous variables.}
#'      \item{"categorical"}{Frequency tables for categorical variables.}
#'      \item{"all"}{Returns both summary statistics and frequency tables.}
#'   }
#'
#'@return A list or an object depending on the value of \code{show}:
#'   \describe{
#'     \item{If \code{show = "continuous"}}{A data frame with descriptive statistics.}
#'     \item{If \code{show = "categorical"}}{A list of frequency tables.}
#'     \item{If \code{show = "all"}}{A list containing both descriptive statistics and frequency tables.}
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
