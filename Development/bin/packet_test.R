source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")

#MUNICH TESTS ----
munich_cont <- Municht2019datasetDescriptiveStatistics(show = "continuous")
munich_cat <- Municht2019datasetDescriptiveStatistics(show = "categorical")
munich_all <- Municht2019datasetDescriptiveStatistics()

munich_t1 <- descriptiveTableMunich2019dataset()
munich_t2 <- descriptiveTableMunich2019dataset("img/munich_table.svg")

#Numerica
munich_p1 <- plotMunich2019dataset(name1 = "age_years")
#Categorica
munich_p2 <- plotMunich2019dataset(name1 = "MGMTmethylation_methylated1_unmethylated0")
#Num vs Num
munich_p3 <- plotMunich2019dataset(name1 = "age_years", name2 = "OS_months")
#Num vs Cat
munich_p4 <- plotMunich2019dataset(name1 = "age_years", name2 = "sex_male0_female1", savePath = "img/")
#Cat vs Num
munich_p5 <- plotMunich2019dataset(name1 = "cHsp70_low0_high1", name2 = "age_years")
#Cat vs Cat
munich_p6 <- plotMunich2019dataset(name1 = "cHsp70_low0_high1", name2 = "MGMTmethylation_methylated1_unmethylated0")

#TAINAN TESTS ----
tainan_cont <- Tainan2020datasetDescriptiveStatistics(show = "continuous")
tainan_cat <- Tainan2020datasetDescriptiveStatistics(show = "categorical")
tainan_all <- Tainan2020datasetDescriptiveStatistics()

tainan_t1 <- descriptiveTableTainan2020dataset()
tainan_t2 <- descriptiveTableTainan2020dataset("img/tainan_table.svg")

#Numerica
tainan_p1 <- plotTainan2020dataset(name1 = "PFS_months")
#Categorica
tainan_p2 <- plotTainan2020dataset(name1 = "chemo_yes1_no0")
#Num vs Num
tainan_p3 <- plotTainan2020dataset(name1 = "PFS_months", name2 = "OS_months")
#Num vs Cat
tainan_p4 <- plotTainan2020dataset(name1 = "PFS_months", name2 = "surgery_yes1_biopsy0")
#Cat vs Num
tainan_p5 <- plotTainan2020dataset(name1 = "TMZ_based_chemo_yes1_no0", name2 = "PFS_months")
#Cat vs Cat
tainan_p6 <- plotTainan2020dataset(name1 = "TMZ_based_chemo_yes1_no0", name2 = "chemo_yes1_no0")

#UTRECHT TESTS ----
utrecht_cont <- Utrecht2019datasetDescriptiveStatistics(show = "continuous")
utrecht_cat <- Utrecht2019datasetDescriptiveStatistics(show = "categorical")
utrecht_all <- Utrecht2019datasetDescriptiveStatistics()

utrecht_t1 <- descriptiveTableUtrecht2019dataset()
utrecht_t2 <- descriptiveTableUtrecht2019dataset("img/utrecht_table.svg")

#Numerica
utrecht_p1 <- plotUtrecht2019dataset(name1 = "OS_months")
#Categorica
utrecht_p2 <- plotUtrecht2019dataset(name1 = "KPS_less70.0_more70.1")
#Num vs Num
utrecht_p3 <- plotUtrecht2019dataset(name1 = "OS_months", name2 = "age_years")
#Num vs Cat
utrecht_p4 <- plotUtrecht2019dataset(name1 = "OS_months", name2 = "post_surgery_therapy_none0_monotherapy1_RTandTMZ2")
#Cat vs Num
utrecht_p5 <- plotUtrecht2019dataset(name1 = "KPS_less70.0_more70.1", name2 = "age_years")
#Cat vs Cat
utrecht_p6 <- plotUtrecht2019dataset(name1 = "SVZ_status_nocontact0_contact1", name2 = "survived_yes1_no0")
