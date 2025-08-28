#' @md
#' @title Plot variables from the munich2019dataset
#'
#' @description This function creates a plot of one or two variables from the 'munich2019dataset' dataframe.
#' It automatically chooses the appropriate plot type based on the variable types.
#' It can export and save the plot by specifying the directory, filename and extension.
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
#'    - filename is the name of the file, default to 'plot_munich2019dataset_var1_var2_timestamp.png';
#'    - extension must be one of the supported 'ggsave' extensions and must be specified, unless using the default file name.
#'
#' @return A 'ggplot2' object representing the generated plot.
#' If the specified variables are not found in the dataset, returns a warning.
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
#' plotMunich2019dataset("age_years")
#'
#' # Bivariate plot without saving
#' plotMunich2019dataset("cHsp70_low0_high1", "sex_male0_female1")
#'
#' \donttest{
#' # Bivariate plot saved in the path directory with the chosen name and extension
#' plotMunich2019dataset("age_years", "sex_male0_female1", savePath = "plots/age_sex_boxplot.png")
#'
#' # Univariate plot saved in the working directory with the chosen name and extension
#' plotMunich2019dataset("sex_male0_female1", savePath = "gender_boxplot.jpeg")
#'
#' # Univariate plot saved in the path directory with default name and extension
#' plotMunich2019dataset("MGMTmethylation_methylated1_unmethylated0", savePath = "munichPlots")
#' }
#'
#' @importFrom ggplot2 labs
#' @importFrom DataExplorer plot_histogram plot_bar plot_boxplot
#'
#' @export
plotMunich2019dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(munich2019dataset))) {
    return(warning(sprintf("No such variable '%s' found in the dataset.", name1)))
  }
  if (!is.na(name2) && !(name2 %in% names(munich2019dataset))) {
    return(warning(sprintf("No such variable '%s' found in the dataset.", name2)))
  }

  if(is.na(name2)) {
    if(is.numeric(munich2019dataset[[name1]]) || is.integer(munich2019dataset[[name1]])) {
      plot <- plot_histogram(munich2019dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(munich2019dataset[[name1]]) || is.factor(munich2019dataset[[name1]])){
      plot <- plot_bar(munich2019dataset[[name1]])[[1]] + labs(x = name1)
    }
  } else {
    if(is.numeric(munich2019dataset[[name1]]) || is.integer(munich2019dataset[[name1]])) {
      plot <- plot_boxplot(munich2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
    else if(is.numeric(munich2019dataset[[name2]]) || is.integer(munich2019dataset[[name2]])){
      plot <- plot_boxplot(munich2019dataset[, c(name1, name2)], by = name1)[[1]]
    }
    else{
      plot <- plot_bar(munich2019dataset[, c(name1, name2)], by = name2)[[1]]
    }
  }

  if(!is.na(savePath)) {
    r <- savePlot(plot,
                  names = c("Munich2019datset", name1, name2),
                  savePath = savePath)
    if(r != 0)
      warning(sprintf("Plot saving canceled: %s", r))
  }
  return(plot)
}
