#' @md
#' @title Plot variables from the Tainan2020dataset
#'
#' @description This function creates a plot of one or two variables from the 'tainan2020dataset' dataframe.
#' It automatically chooses the appropriate plot type based on the variable types and
#' it can export and save the plot by specifying the directory, filename and extension.
#' Provided variable names need to be in the dataset, otherwise an error will be launched.
#' The function makes it easy to plot univariate and bivariate plots while offering a quick way to save and export them.
#'
#' @param name1 Character. The name of the first variable to plot.
#' @param name2 Character (optional). The name of the second variable for bivariate plots. Default is NA.
#' @param savePath Character (optional). File path where the plot should be saved.
#'  Default is NULL which means no plot will be saved.
#'  To save a plot using all the default options put an empty string.
#'  The format must be: 'filepath/filename.extension' where:
#'    - filepath is the directory (must already exist), default is the working directory;
#'    - filename is the name of the file, default to 'plot_Dataset_var1_var2_datetime.png';
#'    - extension must be one of the supported 'ggsave' extensions and must be specified, unless using the default file name.
#'
#' @return A 'ggplot2' object representing the generated plot. If the specified variables are not found in the dataset, returns '-1'.
#'
#' @details
#' The function supports the following plotting logic:
#'    - If only 'name1' is provided:
#'      - Numeric/integer variable → Histogram.
#'      - Character/factor variable → Bar plot.
#'    - If both 'name1' and 'name2' are provided:
#'      - One numeric/integer and one categorical → Boxplot.
#'      - Both categorical → Grouped bar plot.
#'
#' @seealso [DataExplorer::plot_bar()], [DataExplorer::plot_histogram()], [DataExplorer::plot_boxplot], [savePlot()]
#'
#' @examples
#' # Univariate plot without saving
#' plotTainan2020dataset("TMZ_based_chemo_yes1_no0")
#'
#' # Bivariate plot without saving
#' plotTainan2020dataset("PFS_months", "OS_months")
#'
#' ## Not run
#' # Bivariate plot saved in the specified directory with the chosen name and extension
#' plotTainan2020dataset("age_years", "chemo_yes1_no0", savePath = "plots/age_chemo_boxplot.png")
#'
#' # Bivariate plot saved in the working directory with the chosen name and extension
#' plotTainan2020dataset("PFS_months", "OS_months", savePath = "OSvsPFS_plot.pdf")
#'
#' # Bivariate plot saved in a path directory with default name and extension
#' plotTainan2020dataset("PFS_months", "radiation_dose_Gy", savePath = "tainan_numerci_plots")
#'
#' ## End(Not run)
#'
#' @importFrom DataExplorer plot_histogram plot_bar plot_boxplot
#'
#' @export
plotTainan2020dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(tainan2020dataset))) {
    warning(paste("No such variable ", name1, " found in the dataset."))
    return(-1)
  }
  if (!is.na(name2) && !(name2 %in% names(tainan2020dataset))) {
    warning(paste("No such variable ", name1, " found in the dataset."))
    return(-1)
  }

  if(is.na(name2)) {
    if(is.numeric(tainan2020dataset[[name1]]) || is.integer(tainan2020dataset[[name1]])) {
      plot <- plot_histogram(tainan2020dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(tainan2020dataset[[name1]]) || is.factor(tainan2020dataset[[name1]])){
      plot <- plot_bar(tainan2020dataset[[name1]])[[1]] + labs(x = name1)
    }
  } else {
    if(is.numeric(tainan2020dataset[[name1]]) || is.integer(tainan2020dataset[[name1]])) {
      plot <- plot_boxplot(tainan2020dataset[, c(name1, name2)], by = name2)[[1]]
    }
    else if(is.numeric(tainan2020dataset[[name2]]) || is.integer(tainan2020dataset[[name2]])){
      plot <- plot_boxplot(tainan2020dataset[, c(name1, name2)], by = name1)[[1]]
    }
    else{
      plot <- plot_bar(tainan2020dataset[, c(name1, name2)], by = name2)[[1]]
    }
  }

  if(!is.null(savePath)) {
    savePlot(plot,
             names = c("Tainan2020datset", name1, name2),
             savePath = savePath)
  }

  return(plot)
}
