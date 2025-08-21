library(pacman)
p_load(devtools, roxygen2)

#MUNICH TESTS ----
munich_cont <- Munich2019datasetDescriptiveStatistics(show = "continuous")
munich_cat <- Munich2019datasetDescriptiveStatistics(show = "categorical")
munich_all <- Munich2019datasetDescriptiveStatistics()

munich_t1 <- descriptiveTableMunich2019dataset()
descriptiveTableMunich2019dataset("img/munich_table.pdf")
descriptiveTableMunich2019dataset("img/munich_table.png")
descriptiveTableMunich2019dataset("munich_table.png")
descriptiveTableMunich2019dataset("img/")
descriptiveTableMunich2019dataset("img")
descriptiveTableMunich2019dataset("img/munich_table")
descriptiveTableMunich2019dataset("munich_table")

#Numerica
plotMunich2019dataset(name1 = "age_years")
#Categorica
plotMunich2019dataset(name1 = "MGMTmethylation_methylated1_unmethylated0")
#Num vs Num
plotMunich2019dataset(name1 = "age_years", name2 = "OS_months")
#Num vs Cat
plotMunich2019dataset(name1 = "age_years", name2 = "sex_male0_female1", savePath = "img")
#Cat vs Num
plotMunich2019dataset(name1 = "cHsp70_low0_high1", name2 = "age_years")
#Cat vs Cat
plotMunich2019dataset(name1 = "cHsp70_low0_high1", name2 = "MGMTmethylation_methylated1_unmethylated0")

#TAINAN TESTS ----
tainan_cont <- Tainan2020datasetDescriptiveStatistics(show = "continuous")
tainan_cat <- Tainan2020datasetDescriptiveStatistics(show = "categorical")
tainan_all <- Tainan2020datasetDescriptiveStatistics()

tainan_t1 <- descriptiveTableTainan2020dataset()
descriptiveTableTainan2020dataset("img/tainan_table.png")
descriptiveTableTainan2020dataset("img/tainan_table.pdf")
descriptiveTableTainan2020dataset("tainan_table.png")
descriptiveTableTainan2020dataset("img")
descriptiveTableTainan2020dataset("img/")
descriptiveTableTainan2020dataset("img/tainan")
descriptiveTableTainan2020dataset("tainan")

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
descriptiveTableUtrecht2019dataset("img/utrecht_table.png")
descriptiveTableUtrecht2019dataset("img/utrecht_table.pdf")
descriptiveTableUtrecht2019dataset("utrecht_table.png")
descriptiveTableUtrecht2019dataset("img/")
descriptiveTableUtrecht2019dataset("img")
descriptiveTableUtrecht2019dataset("img/utrecht")
descriptiveTableUtrecht2019dataset("utrecht")

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
