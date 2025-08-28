library(testthat)
library(glioblastomaEHRsData)

test_that("descriptiveTableMunich2019dataset() return a tabe1 object without saving anything", {
  t1 <- descriptiveTableMunich2019dataset(savePath = NULL)
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableMunich2019dataset(savePath = 'images/munich_test_table.png') return a table1 object and save a png file", {
  path <- testthat::test_path("images", "munich_test_table.png")
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  t1 <- descriptiveTableMunich2019dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableMunich2019dataset(savePath = 'munich_test_table.html') return a table1 object and save a html file", {
  path <- testthat::test_path("", "munich_test_table.html")
  t1 <- descriptiveTableMunich2019dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableMunich2019dataset(savePath = 'munich_test_table.pdf') return a table1 object and save a pdf file", {
  #skip_on_cran(message = "CRAN does not have an extensive LaTex engine.")
  skip_on_cran()
  path <- testthat::test_path("", "munich_test_table.pdf")
  t1 <- descriptiveTableMunich2019dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableMunich2019dataset(savePath = 'tables') return a table1 object and generates a 'Directory not found' warning'", {
  expect_warning(t1 <- descriptiveTableMunich2019dataset(savePath = 'tables'))
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableMunich2019dataset(savePath = 'munich_test_table.jpeg') return a table1 object and generates a 'Extension not supported' warning", {
  path <- testthat::test_path("", "munich_test_table.jpeg")
  expect_warning(t1 <- descriptiveTableMunich2019dataset(savePath = path))
  expect_s3_class(t1, c("table1", "character"))
})
