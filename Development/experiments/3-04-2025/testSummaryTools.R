source("../../Development/bin/loadTestDataset.R")
p_load("summarytools")

st_options(bootstrap.css = TRUE,
           custom.css = "../../Development/src/custom.css")
freq(munich2019dataset, plain.ascii = FALSE, style = "rmarkdown") %>% stview()

munich2019dataset %>% descr(transpose = TRUE) %>% stview()

munich2019dataset %>% dfSummary(style = "grid",
                                varnumbers = FALSE,
                                valid.col = FALSE) %>% stview()

stby(data = munich2019dataset,
     INDICES = munich2019dataset$sex_male0_female1,
     FUN = descr,
     stats = "fivenum") %>% stview()
