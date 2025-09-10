#' @md
#' @title saveTable
#'
#' @description Internal function to save a table1 table object in png, pdf or html format.
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
#'   - extension must be one of 'png', 'pdf' or 'html, must exists unless using the default file name.
#'
#'
#' @return 0 if the save was successfull, or a warning message if there were errors.
#'
#' @seealso This internal functions is used by: [descriptiveTableMunich2019dataset()], [descriptiveTableTainan2020dataset()] and [descriptiveTableUtrecht2019dataset()]
#'
#' @importFrom table1 t1flex
#' @importFrom flextable save_as_image
#' @importFrom rmarkdown render
#' @import tinytex
#'
#' @keywords internal

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
    savePath <- default_name
  }
  else if(!grepl("\\.", basename(savePath))) {
    savePath <- file.path(savePath, default_name)
  }

  savePath <- normalizePath(savePath, mustWork = FALSE)
  save_dir <- dirname(savePath)

  if(!dir.exists(dirname(savePath))){
    return(sprintf("Specified directory '%s' does not exists", savePath))
  }

  # Check the extension
  ext <- tools::file_ext(savePath)
  if(!grepl("^png$|^pdf$|^html$", ext)) {
    return("Invalid extension, please use .png, .pdf or .html instead")
  }

  if (ext %in% c("pdf", "html")) {
    tempfile <- tempfile(fileext = ".Rmd")
    if(ext == 'pdf') {
      if(!is_tinytex()) {
        return('Please install TinyTex using tinytex::install_tinytex(bundle = "TinyTeX")')
      }
      rmd_content <- sprintf('
---
output: pdf_document
---

```{r show-tableone, echo=FALSE, results="asis"}
t1

')
    } else if (ext == "html") {
      rmd_content <- sprintf('
---
title: "Descriptive %s Table"
output: html_document
---

```{r show-tableone, echo=FALSE, result="asis"}
t1
```
', names[1])
    }
    cat(rmd_content, file = tempfile)

    rmarkdown::render(input = tempfile,
                      output_file = savePath,
                      output_format = ifelse(ext == 'html', 'html_document', 'pdf_document'),
                      clean = TRUE)

    file.remove(tempfile)
  } else if (ext == 'png') {
    save_as_image(t1flex(t1), savePath)
  }
  return(0)
}
