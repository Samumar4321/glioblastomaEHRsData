source("~/GitHub/glioblastomaEHRsData/Development/bin/loadTestDataset.R")
p_load("table1", "kableExtra", "flextable", "magick", "grid")

df <- munich2019dataset

df$sex_male0_female1 <-
  factor(df$sex_male0_female1,
         levels=c(0, 1),
         labels=c("Male", "Female"))

df$survived_yes1_no0 <-
  factor(df$survived_yes1_no0,
         levels = c(0,1),
         labels = c("Dead", "Alive"))

df$tumor_progression_yes1_no0 <-
  factor(df$tumor_progression_yes1_no0,
         levels = c(0,1),
         labels = c("No", "Yes"))

df$MGMTmethylation_methylated1_unmethylated0 <-
  factor(df$MGMTmethylation_methylated1_unmethylated0,
         levels = c(0, 1),
         labels = c("No", "Yes"))

df$cHsp70_low0_high1 <-
  factor(df$cHsp70_low0_high1,
         levels = c(0, 1),
         labels = c("Low", "High"))

label(df$sex_male0_female1) <- "Sex"
label(df$age_years) <- "Age (years)"
label(df$OS_months) <- "Overall Survival (months)"
label(df$survived_yes1_no0) <- "Alive"
label(df$PFS_months) <- "Progress Free Survival (months)"
label(df$tumor_progression_yes1_no0) <- "Tumor progression"
label(df$MGMTmethylation_methylated1_unmethylated0)  <- "MGMT Methylation"
label(df$cHsp70_low0_high1) <- "cHsp70 level"

t1 <- table1(~ sex_male0_female1 +
               age_years +
               OS_months +
               survived_yes1_no0 +
               PFS_months +
               tumor_progression_yes1_no0 +
               MGMTmethylation_methylated1_unmethylated0 +
               cHsp70_low0_high1,
             data = df,
             topclass = "Rtable1-shade",
             render.continuous = c( .= "Median [MIN - MAX]",
                                    .= "Mean (SD)",
                                    .= "Q1 - Q3"),
             caption = "Overall table of descriptive statistic for Munich2019dataset",
             footnote = "Generated using table1")

t2 <- table1(~ sex_male0_female1 +
               age_years +
               OS_months +
               PFS_months +
               tumor_progression_yes1_no0 +
               MGMTmethylation_methylated1_unmethylated0 +
               cHsp70_low0_high1 |
               survived_yes1_no0,
             data = df,
             topclass = "Rtable1-shade",
             render.continuous = c( .= "Median [MIN - MAX]",
                                    .= "Mean (SD)",
                                    .= "Q1 - Q3"),
             caption = "Descriptive statistic of Munich2019dataset",
             footnote = "Stratification on the patient status")

kt1 <- t1kable(t1)
kt2 <- t1kable(t2)
ft1 <- t1flex(t1)
ft2 <- t1flex(t2)

save_as_image(ft1, "img/t1.png")
save_as_image(ft2, "img/t2.png")


img_dir <- "img/"


img_files <- list.files(path = img_dir, pattern = "\\.png$", full.names = TRUE)
img_files <- sort(img_files)

pdf("tabelle_output.pdf", width = 8, height = 11)

for (img_path in img_files) {
  img <- image_read(img_path)
  grid::grid.raster(img)
  grid::grid.newpage()
}

dev.off()

cat('
---
title: "Report"
author: "XXX"
date: "today"
output: pdf_document
---

```{r show-flextable, echo=FALSE, result="asis"}
t1
t1flex(t1)
```
', file = "table1.Rmd")


rmarkdown::render("table1.Rmd", output_file = "tabelle_output.pdf")
file.remove("table1.Rmd")
