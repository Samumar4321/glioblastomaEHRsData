require(pacman)
library(datasets)
library(readxl)

head(iris)

plot(iris$Species)
plot(iris$Petal.Length)
plot(iris$Species, iris$Sepal.Length)
plot(iris)

testdataset <- read_excel("testdataset")
head(testdataset)

plot(testdataset$`patient ID`)
plot(testdataset$age_years)

mean(testdataset$age_years)       #media
median(testdataset$age_years)     #mediana
sd(testdataset$age_years)         #deviazione standard
range(testdataset$age_years)      #range inclusivo

testdataset$sex_male0_female1 <- factor(testdataset$sex_male0_female1, 
                                        levels = c(0,1), 
                                        labels = c("Male", "Female"))

testdataset$sex_male0_female1

plot(testdataset$sex_male0_female1)

testdataset2 <- read_excel("C:/Users/Samuele/Downloads/Munich2019dataset.xlsx", 
                                col_types = c("numeric", "logical", "numeric", 
                                              "text", "numeric", "text", "numeric", 
                                              "numeric", "numeric"))
View(Munich2019dataset)

