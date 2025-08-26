library(testthat)
library(glioblastomaEHRsData)

test_that("descriptiveTableUtrecht2019dataset() return a tabe1 object without saving anything", {
  t1 <- descriptiveTableUtrecht2019dataset(savePath = NULL)
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableUtrecht2019dataset(savePath = 'images/utrecht_test_table.png') return a table1 object and save a file", {
  path <- testthat::test_path("images", "utrecht_test_table.png")
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  t1 <- descriptiveTableUtrecht2019dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableUtrecht2019dataset(savePath = 'utrecht_test_table.pdf') return a table1 object and save a file", {
  path <- testthat::test_path("", "utrecht_test_table.pdf")
  t1 <- descriptiveTableUtrecht2019dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableUtrecht2019dataset(savePath = 'tables') return a table1 object and generates a 'Directory not found' warning'", {
  expect_warning(t1 <- descriptiveTableUtrecht2019dataset(savePath = 'tables'))
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableUtrecht2019dataset(savePath = 'utrecht_test_table.jpeg') return a table1 object and generates a 'Extension not supported' warning", {
  path <- testthat::test_path("", "utrecht_test_table.jpeg")
  expect_warning(t1 <- descriptiveTableUtrecht2019dataset(savePath = path))
  expect_s3_class(t1, c("table1", "character"))
})
