#' @md
#' @title saveTable
#'
#' @description Internal function to save a table1 table object in png or pdf format.
#' Default extension is png, default_filename is in this format: 'table_dataset_timestamp.png'.
#'
#' @details
#' The functions takes a table1 object, a character vector containing the dataset name and the save path to export the table.
#' It first checks whether the dataset name is present, the it creates the default file name.
#' If the save path doesn't exist or in an empty string it saves the plot in the working directory using the default file name.
#' If the save path exists but doesn't contain the file name, it saves the plot in the path directory using the default file name.
#' If the save path exists and has a file name, it saves the plot in the path directory with the user chosen file name.
#'
#' @param t1 A 'table1' object to be saved.
#' @param names A character vector of at least 1 item: the dataset name,
#' other items may be used for testing
#' @param savePath A character string specifying the full path and filename for the exported table.\cr
#' The format must be: 'filepath/filename.extension' where:
#'   - filepath is the directory (must already exist), default to the working directory;
#'   - filename is the name of the file, default to default_filename;
#'   - extension must be one of 'png', or 'pdf', must exists unless using the default file name.
#'
#'
#' @return A status number, 0 if the save was successfull, -1 if there were errors.
#'
#' @seealso This internal functions is used by: [descriptiveTableMunich2019dataset()], [descriptiveTableTainan2020dataset()] and [descriptiveTableUtrecht2019dataset()]
#'
#' @importFrom table1 t1flex
#' @importFrom flextable save_as_image
#'
#' @keywords internal

# saveTable <- function(t1, names, savePath = "") {
#   dataset <- names[1]
#   if(is.na(dataset)) {
#     stop("Dataset not named")
#   }
#   default_name <- paste0(paste("table",
#                                dataset,
#                                Sys.Date(),
#                                format(Sys.time(), "%Hh%Mm%Ss"),
#                                sep = "_"),
#                          ".png")
#
#   if(is.null(savePath) || savePath == "") {
#     save_as_image(t1flex(t1), default_name)
#     return(0)
#   }
#   else {
#     has_filename <- grepl("\\.", basename(savePath))
#     if(has_filename){
#       #CONTROLLA CHE LA DIR ESISTA
#       if(!dir.exists(dirname(savePath))){
#         stop("Specified directory does not exists")
#         return(-1)
#       }
#
#       #CONTROLLA CHE ABBIA GIUSTA ESTENSIONE
#       ext <- tools::file_ext(savePath)
#       if(!grepl("^svg$|^png$|^pdf$", ext)) {
#         stop("Invalid extension, please use .svg, .png or .pdf instead")
#         return(-1)
#       }
#
#       html_code <- as.character(t1)
#       tmp_html <- tempfile(fileext = ".html")
#       htmltools::save_html(htmltools::HTML(html_code), tmp_html)
#
#       #SALVA CON FILENAME UTENTE
#       if(ext == "pdf") {
#         webshot(tmp_html, file = savePath, selector = "table", delay = 0.5)
#       }
#       else if (ext == "png") {
#         webshot(tmp_html, file = savePath, selector = "table", delay = 0.5)
#       }
#       else if (ext == "svg") {
#         save_as_image(t1flex(t1), savePath)
#       }
#       return(0)
#     }
#     else{
#       #CONTROLLA CHE LA DIR ESISTA
#       if(!dir.exists(savePath)) {
#         stop("Specified directory does not exists")
#         return(-1)
#       }
#       #SALVA NELLA DIR CON DEFAULTNAME
#       save_as_image(t1flex(t1), paste0(savePath, "/", default_name))
#       return(0)
#     }
#   }
# }


saveTable <- function(t1, names, savePath = "") {
  dataset <- names[1]
  if(is.na(dataset)) {
    return("Dataframe name not found")
  }
  default_name <- paste0(paste("table",
                               dataset,
                               Sys.Date(),
                               format(Sys.time(), "%Hh%Mm%Ss"),
                               sep = "_"),
                         ".png")

  if(is.null(savePath) || savePath == "" || is.na(savePath)) {
    save_as_image(t1flex(t1), default_name)
    return(0)
  }
  else {
    has_filename <- grepl("\\.", basename(savePath))
    if(has_filename) {
      # Check if the directory exists
      if(!dir.exists(dirname(savePath))){
        return(sprintf("Specified directory '%s' does not exists", dirname(savePath)))
      }
      # Check the extension
      ext <- tools::file_ext(savePath)
      if(!grepl("^png$|^pdf$", ext)) {
        return("Invalid extension, please use .png or .pdf instead")
      }

      # Save using the input filename
      if(ext == "pdf") {
        cat('
---
output: pdf_document
---

```{r show-flextable, echo=FALSE, result="asis"}
t1
```
', file = "table1.Rmd")
        rmarkdown::render("table1.Rmd", output_file = savePath)
        file.remove("table1.Rmd")
      }
      else if (ext == "png") {
        save_as_image(t1flex(t1), savePath)
      }
      return(0)
    }
    else {
      # Check if the directory exists
      if(!dir.exists(savePath)) {
        return(sprintf("Specified directory '%s' does not exists", savePath))
      }
      # Save in the path directory with default filename
      save_as_image(t1flex(t1), paste0(savePath, "/", default_name))
      return(0)
    }
  }
}
