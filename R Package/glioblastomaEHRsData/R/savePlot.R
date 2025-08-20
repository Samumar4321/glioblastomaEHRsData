#' @md
#' @title Save a plot
#'
#' @description Internal function to save a 1D or 2D ggplot2 plot specifying the filepath, filename and extension.
#' Supported extensions are the ones supported by 'ggsave', default extension is .png.
#' Default_filename is in this format: 'plot_Dataset_var1_var2_datetime.png'
#'
#' @details
#' The functions takes a table1 object, a character vector containing the dataset name and the save path to export the table.
#' It first checks whether the dataset name is present, the it creates the default file name.
#' If the save path doesn't exist or in an empty string it saves the plot in the working directory using the default file name.
#' If the save path exists but doesn't contain the file name, it saves the plot in the path directory using the default file name.
#' If the save path exists and has a file name, it saves the plot in the path directory with the user chosen file name.
#'
#' @param plot 'ggplot2' object. The plot to be saved.
#' @param names List. List of at least 2 items, first the dataset name,
#' second the x variable of the plot, and third the y variable of the plot (only in bivariate plots).
#' @param savePath Character (optional). String specifying the path and filename for the exported plot.\cr
#' The format must be: 'filepath/filename.extension' where:
#'   - filepath is the directory (must already exist), default to the working directory;
#'   - filename is the name of the file, default to default_filename;
#'   - extension must be one of the supported 'ggsave' extensions, must exists unless using the default file name.
#'
#' @return A status number, 0 if the save was successfull, -1 if there were errors.
#'
#' @seealso This internal functions is used by: [plotMunich2019dataset()], [plotTainan2020dataset()] and [plotUtrecht2019dataset()]
#'
#' @importFrom ggplot2 ggsave
#'
#' @keywords internal
savePlot <- function(plot, names, savePath = "") {
  dataset <- names[1]
  arg1 <- names[2]
  arg2 <- names[3]
  if(is.na(arg2) || arg2 == "") {
    default_name <- paste0(paste("plot",
                                 dataset,
                                 arg1,
                                 Sys.Date(),
                                 format(Sys.time(), "%Hh%Mm%Ss"),
                                 sep = "_"),
                           ".png")
  } else {
    default_name <- paste0(paste("plot",
                                 dataset,
                                 arg1,
                                 arg2,
                                 Sys.Date(),
                                 format(Sys.time(), "%Hh%Mm%Ss"),
                                 sep = "_"),
                           ".png")
  }

  if(is.na(savePath) || savePath == "") {
    #SAVE WITH DEFAULT NAME
    ggsave(filename = default_name, plot = plot)
    return(0)
  }
  else {
    has_filename <- grepl("\\.", basename(savePath))
    dir_path <- if(has_filename) dirname(savePath) else savePath
    #CHECK IF THE DIRECTORY EXISTS
    if(!dir.exists(dir_path)) {
      warning("Specified directory does not exists, plot saving canceled.")
      return(-1)
    }

    if (has_filename) {
      ggsave(filename = basename(savePath), path = dir_path, plot = plot)
    } else {
      ggsave(filename = default_name, path = savePath, plot = plot)
    }
    # if(has_filename){
    #   #CHECK IF THE DIRECTORY EXISTS
    #   if(!dir.exists(dirname(savePath))){
    #     warning("Specified directory does not exists, plot saving canceled.")
    #     return(-1)
    #   }
    #   #SAVE IN THE SPECIFIED DIRECTORY WITH THE FILENAME (
    #   #both dir and filename were specified in savePath)
    #   ggsave(path = dirname(savePath), filename = basename(savePath), plot = plot)
    #   return(0)
    # }
    # else{
    #   #CHECK IF THE DIRECTORY EXISTS
    #   if(!dir.exists(savePath)) {
    #     warning("Specified directory does not exists, plot saving canceled.")
    #     return(-1)
    #   }
    #   #SAVE IN THE SPECIFIED DIRECTORY WITH THE DEFAULT FILENAME
    #   #(only the dir was specified in savePath)
    #   ggsave(path = savePath, filename = default_name, plot = plot)
    #   return(0)
    # }
  }
}
