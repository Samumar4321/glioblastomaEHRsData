






saveTable <- function(t1, names, savePath = NULL) {
  dataset <- names[1]
  if(is.na(dataset)) {
    stop("Dataset not named")
  }
  default_name <- paste0(paste("table",
                               dataset,
                               Sys.Date(),
                               format(Sys.time(), "%Hh%Mm%Ss"),
                               sep = "_"),
                         ".svg")

  if(is.null(savePath) || savePath == "") {
    save_as_image(t1flex(t1), default_name)
    return(0)
  }
  else {
    has_filename <- grepl("\\.", basename(savePath))
    if(has_filename){
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(dirname(savePath))){
        stop("Specified directory does not exists")
        return(-1)
      }
      #CONTROLLA CHE ABBIA GIUSTA ESTENSIONE
      if(!grepl("\\.(svg|pdf|png)$", basename(savePath))) {
        stop("File of invalid format, use .svg, .png or .pdf instead")
        return(-1)
      }
      #SALVA CON FILENAME UTENTE
      if(grepl("\\.(pdf)$", basename(savePath))) {
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
        return(0)
      }
      save_as_image(t1flex(t1), savePath)
      return(0)
    }
    else{
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(savePath)) {
        stop("Specified directory does not exists")
        return(-1)
      }
      #SALVA NELLA DIR CON DEFAULTNAME
      save_as_image(t1flex(t1), paste0(savePath, "/", default_name))
      return(0)
    }
  }
}
