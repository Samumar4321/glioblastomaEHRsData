library(testthat)
library(glioblastomaEHRsData)

test_that("descriptiveTableTainan2020dataset() return a tabe1 object without saving anything", {
  t1 <- descriptiveTableTainan2020dataset(savePath = NULL)
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tables/') return a table1 object and save a png file", {
  path <- file.path(paste0(tempdir(), '/tables'), "")
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  t1 <- descriptiveTableTainan2020dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tables/tainan_test_table.html') return a table1 object and save a html file", {
  path <- file.path(tempdir(), "tables/tainan_test_table.html")
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  t1 <- descriptiveTableTainan2020dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tainan_test_table.pdf') return a table1 object and save a pdf file", {
  #skip_on_cran(message = "CRAN does not have an extensive LaTex engine.")
  skip_on_cran()
  path <- file.path(tempdir(), "tainan_test_table.pdf")
  t1 <- descriptiveTableTainan2020dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'imgs') return a table1 object and generates a 'Directory not found' warning'", {
  path <- file.path(tempdir(), "imgs")
  expect_warning(t1 <- descriptiveTableTainan2020dataset(savePath = path))
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tainan_test_table.jpeg') return a table1 object and generates a 'Extension not supported' warning", {
  path <- file.path(tempdir(), "tainan_test_table.jpeg")
  expect_warning(t1 <- descriptiveTableTainan2020dataset(savePath = path))
  expect_s3_class(t1, c("table1", "character"))
})
