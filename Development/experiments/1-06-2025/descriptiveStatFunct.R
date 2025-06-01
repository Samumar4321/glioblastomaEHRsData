source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("dlookr", "summarytools")

descriptiveStatisticsMunich2019dataset <- function(show = "all"){
  result <- switch(show,
                   "continuous" = dlookr::diagnose_numeric(munich2019dataset),
                   "categorical" = dlookr::diagnose_category(munich2019dataset),
                   "all" = list(dlookr::diagnose_numeric(munich2019dataset),
                                dlookr::diagnose_category(munich2019dataset)))
  return(result)
}

descriptiveStatisticsTainan2020dataset <- function(show = "all"){
  result <- switch(show,
                   "continuous" = dlookr::diagnose_numeric(tainan2020dataset),
                   "categorical" = dlookr::diagnose_category(tainan2020dataset),
                   "all" = list(dlookr::diagnose_numeric(tainan2020dataset),
                                dlookr::diagnose_category(tainan2020dataset)))
  return(result)
}

descriptiveStatisticsUtrecht2019dataset <- function(show = "all"){
  result <- switch(show,
                   "continuous" = dlookr::diagnose_numeric(utrecht2019dataset),
                   "categorical" = dlookr::diagnose_category(utrecht2019dataset),
                   "all" = list(dlookr::diagnose_numeric(utrecht2019dataset),
                                dlookr::diagnose_category(utrecht2019dataset)))
  return(result)
}

Municht2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(munich2019dataset),
                   "categorical" = summarytools::freq(munich2019dataset),
                   "all" = list(summarytools::descr(munich2019dataset),
                                summarytools::freq(munich2019dataset)))
  return(result)
}

Tainan2020datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(tainan2020dataset),
                   "categorical" = summarytools::freq(tainan2020dataset),
                   "all" = list(summarytools::descr(tainan2020dataset),
                                summarytools::freq(tainan2020dataset)))
  return(result)
}

Utrecht2019datasetDescriptiveStatistics <- function(show = "all"){
  result <- switch(show,
                   "continuous" = summarytools::descr(utrecht2019dataset),
                   "categorical" = summarytools::freq(utrecht2019dataset),
                   "all" = list(summarytools::descr(utrecht2019dataset),
                                summarytools::freq(utrecht2019dataset)))
  return(result)
}
