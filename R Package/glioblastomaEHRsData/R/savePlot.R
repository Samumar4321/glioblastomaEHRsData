#' @title savePlot
#'
#' @description Internal function to save a 1D or 2D ggplot2 plot specifying the filepath, filename and extension.
#' Supported extensions are the ones supported by 'ggsave', default extension is .png.
#' Default_filename is in this format: 'plot_Dataset_var1_var2_datetime.png'
#'
#' @param plot A 'ggplot2' object, the plot to be saved.
#' @param names A character vector of at least 2 names, first the dataset name,
#' second the x variable of the plot, and third the y variable of the plot (only in bivariate plots).
#' @param savePath (Optional)A character string specifying the path and filename for the exported plot.\cr
#' The format must be: 'filepath/filename.extension' where:
#' \itemize{
#'   \item filepath is the directory (must already exist), default to the working directory;
#'   \item filename is the name of the file, default to default_filename;
#'   \item extension must be one of the supported 'ggsave' extensions, default is .png.
#' }
#'
#' @return A status number, 0 if the save was successfull, -1 if there were errors.
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
