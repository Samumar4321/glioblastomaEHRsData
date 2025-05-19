source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("dlookr", "Hmisc", "summarytools", "explore")

#Hmisc
Hmisc::describe(utrecht2019dataset)

#dlookr
dc <- diagnose_category(df)
dn <- diagnose_numeric(df)

desc <- dlookr::describe(df)

sumNum <- summary(dlookr::univar_numeric(df)) #schifo


#base R
summary(utrecht2019dataset)

#summarytools very good
summarytools::descr(utrecht2019dataset)
summarytools::freq(utrecht2019dataset)[[1]][1]

#explore
explore(df)
