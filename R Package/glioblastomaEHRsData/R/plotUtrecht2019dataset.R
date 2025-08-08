#' @title Plot variables from the Utrecht2019dataset
#'
#' @description This function creates a plot of one or two variables from the 'utrecht2019dataset' dataframe.
#' It automatically chooses the appropriate plot type based on the variable types and
#' it can export and save the plot by specifying the directory, filename and extension.
#' Provided variable names need to be in the dataset, otherwise an error will be launched.
#' The function makes it easy to plot univariate and bivariate plots while offering a quick way to save and export them.
#'
#' @param name1 Character. The name of the first variable to plot.
#' @param name2 Character (optional). The name of the second variable for bivariate plots. Default is NA.
#' @param savePath Character (optional). File path where the plot should be saved. Default is NULL.
#'  The format must be: 'filepath/filename.extension' where:
#'  \itemize{
#'    \item filepath is the directory (must already exist), default is the working directory;
#'    \item filename is the name of the file, default to 'plot_Dataset_var1_var2_datetime.png';
#'    \item extension must be one of the supported 'ggsave' extensions, default is .png.
#' }
#'
#' @return A 'ggplot2' object representing the generated plot. If the specified variables are not found in the dataset, returns '-1'.
#'
#' @details
#' The function supports the following plotting logic:
#' \itemize{
#'   \item If only 'name1' is provided:
#'     \itemize{
#'       \item Numeric/integer variable → Histogram.
#'       \item Character/factor variable → Bar plot.
#'     }
#'   \item If both 'name1' and 'name2' are provided:
#'     \itemize{
#'       \item One numeric/integer and one categorical → Boxplot.
#'       \item Both categorical → Grouped bar plot.
#'     }
#' }
#'
#' @seealso \code{\link{plot_histogram}}, \code{\link{plot_bar}}, \code{\link{plot_boxplot}}, \code{\link{savePlot}}
#'
#' @examples
#' plotUtrecht2019dataset("SVZ_status_nocontact0_contact1")
#' plotUtrecht2019dataset("post_surgery_therapy_none0_monotherapy1_RTandTMZ2", "OS_months")
#' plotUtrecht2019dataset("age_years", "KPS_less70.0_more70.1", savePath = "plots/age_KPS_boxplot.png")
#'
#' @importFrom DataExplorer plot_histogram, plot_bar, plot_boxplot
#'
#' @export
plotUtrecht2019dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(utrecht2019dataset))) {
    warning(paste("No such variable ", name1, " found in the dataset."))
    return(-1)
  }
  if (!is.na(name2) && !(name2 %in% names(utrecht2019dataset))) {
    warning(paste("No such variable ", name1, " found in the dataset."))
    return(-1)
  }

  if(is.na(name2)) {
    if(is.numeric(utrecht2019dataset[[name1]]) || is.integer(utrecht2019dataset[[name1]])) {
      plot <- plot_histogram(utrecht2019dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(utrecht2019dataset[[name1]]) || is.factor(utrecht2019dataset[[name1]])){
      plot <- plot_bar(utrecht2019dataset[[name1]])[[1]] + labs(x = name1)
    }
  }
  else{
    if(is.numeric(utrecht2019dataset[[name1]]) || is.integer(utrecht2019dataset[[name1]])) {
      plot <- plot_boxplot(utrecht2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
    else if(is.numeric(utrecht2019dataset[[name2]]) || is.integer(utrecht2019dataset[[name2]])){
      plot <- plot_boxplot(utrecht2019dataset[, c(name1, name2)], by = name1)[[1]]
    }
    else{
      plot <- plot_bar(utrecht2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
  }

  if(!is.null(savePath)) {
    savePlot(plot,
             names = c("Utrecht2019datset", name1, name2),
             savePath = savePath)
  }

  return(plot)
}
