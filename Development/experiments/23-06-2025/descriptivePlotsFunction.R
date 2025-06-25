source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("DataExplorer", "ggplot2")


plotMunich2019dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(munich2019dataset))) {
    stop(paste("La variabile", name1, "non è presente nel dataset."))
  }
  if (!is.na(name2) && !(name2 %in% names(munich2019dataset))) {
    stop(paste("La variabile", name2, "non è presente nel dataset."))
  }

  if(is.na(name2)) {
    if(is.numeric(munich2019dataset[[name1]]) || is.integer(munich2019dataset[[name1]])) {
      plot <- plot_histogram(munich2019dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(munich2019dataset[[name1]]) || is.factor(munich2019dataset[[name1]])){
      plot <- plot_bar(munich2019dataset[[name1]])[[1]] + labs(x = name1)
    }
  }
  else
    plot <- plot_boxplot(munich2019dataset[, c(name1, name2)], by = name2)[[1]]

savePlot(plot,
         names = c("Munich2019datset", name1, name2),
         savePath = savePath)
}

plotTainan2020dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(tainan2020dataset))) {
    stop(paste("La variabile", name1, "non è presente nel dataset."))
  }
  if (!is.na(name2) && !(name2 %in% names(tainan2020dataset))) {
    stop(paste("La variabile", name2, "non è presente nel dataset."))
  }

  if(is.na(name2)) {
    if(is.numeric(tainan2020dataset[[name1]]) || is.integer(tainan2020dataset[[name1]])) {
      plot <- plot_histogram(tainan2020dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(tainan2020dataset[[name1]]) || is.factor(tainan2020dataset[[name1]])){
      plot <- plot_bar(tainan2020dataset[[name1]])[[1]] + labs(x = name1)
    }
  }
  else
    plot <- plot_boxplot(tainan2020dataset[, c(name1, name2)], by = name2)[[1]]

  savePlot(plot,
           names = c("Tainan2020dataset", name1, name2),
           savePath = savePath)
}

plotUtrecht2019dataset <- function(name1, name2 = NA, savePath = NA) {
  if (!(name1 %in% names(utrecht2019dataset))) {
    stop(paste("La variabile", name1, "non è presente nel dataset."))
  }
  if (!is.na(name2) && !(name2 %in% names(utrecht2019dataset))) {
    stop(paste("La variabile", name2, "non è presente nel dataset."))
  }

  if(is.na(name2)) {
    if(is.numeric(utrecht2019dataset[[name1]]) || is.integer(utrecht2019dataset[[name1]])) {
      plot <- plot_histogram(utrecht2019dataset[[name1]])[[1]] + labs(x = name1)
    }
    else if(is.character(utrecht2019dataset[[name1]]) || is.factor(utrecht2019dataset[[name1]])){
      plot <- plot_bar(utrecht2019dataset[[name1]])[[1]] + labs(x = name1)
    }
  }
  else
    plot <- plot_boxplot(utrecht2019dataset[, c(name1, name2)], by = name2)[[1]]

  savePlot(plot,
           names = c("Utrecht2019dataset", name1, name2),
           savePath = savePath)
}


savePlot <- function(p, names, savePath = NA) {
  dataset <- names[1]
  arg1 <- names[2]
  arg2 <- names[3]
  if(is.na(arg2)) {
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
    #SAVE CON DEFAULT NAME
    ggsave(filename = default_name, plot = p)
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
      #SALVA CON FILENAME UTENTE
      ggsave(path = dirname(savePath), filename = basename(savePath), plot = p)
      return(0)
    }
    else{
      #CONTROLLA CHE LA DIR ESISTA
      if(!dir.exists(savePath)) {
        stop("Specified directory does not exists")
        return(-1)
      }
      #SALVA NELLA DIR CON DEFAULTNAME
      ggsave(path = savePath, filename = default_name, plot = p)
      return(0)
    }
  }
}
