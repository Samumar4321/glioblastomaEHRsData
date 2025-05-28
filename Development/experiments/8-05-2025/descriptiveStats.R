source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("dlookr", "Hmisc", "summarytools", "explore")

#Hmisc
Hmisc::describe(utrecht2019dataset)

#dlookr
diagnose_category(df)
diagnose_numeric(df)

dlookr::describe(df)

summary(dlookr::univar_numeric(df))


#base R
summary(utrecht2019dataset)

#summarytools
summarytools::descr(df)[[1]]
summarytools::freq(df)[[1]][1]

#explore
explore(df)
