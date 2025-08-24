library(testthat)
library(glioblastomaEHRsData)

test_that("descriptiveTableTainan2020dataset() return a tabe1 object without saving anything", {
  t1 <- descriptiveTableTainan2020dataset(savePath = NULL)
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'images/tainan_test_table.png') return a table1 object and save a file", {
  path <- testthat::test_path("images", "tainan_test_table.png")
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  t1 <- descriptiveTableTainan2020dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tainan_test_table.pdf') return a table1 object and save a file", {
  path <- testthat::test_path("", "tainan_test_table.pdf")
  t1 <- descriptiveTableTainan2020dataset(savePath = path)
  expect_s3_class(t1, c("table1", "character"))
  expect_true(file.exists(path))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tables') return a table1 object and generates a 'Directory not found' warning'", {
  expect_warning(t1 <- descriptiveTableTainan2020dataset(savePath = 'tables'))
  expect_s3_class(t1, c("table1", "character"))
})

test_that("descriptiveTableTainan2020dataset(savePath = 'tainan_test_table.jpeg') return a table1 object and generates a 'Extension not supported' warning", {
  path <- testthat::test_path("", "tainan_test_table.jpeg")
  expect_warning(t1 <- descriptiveTableTainan2020dataset(savePath = path))
  expect_s3_class(t1, c("table1", "character"))
})
