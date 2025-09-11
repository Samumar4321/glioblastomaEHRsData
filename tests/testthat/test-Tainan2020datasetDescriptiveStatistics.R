library(testthat)
library(glioblastomaEHRsData)

test_that("Tainan2020datasetDescriptiveStatistics() return a list of 2 named elements", {
  stats <- Tainan2020datasetDescriptiveStatistics()
  expect_type(stats, "list")
  expect_length(stats, 2)
  expect_named(stats, expected = c("continuous", "categorical"))
})

test_that("Tainan2020datasetDescriptiveStatistics(show = 'all') return a list of 2 named elements", {
  stats <- Tainan2020datasetDescriptiveStatistics(show = "all")
  expect_type(stats, "list")
  expect_length(stats, 2)
  expect_named(stats, expected = c("continuous", "categorical"))
})

test_that("Tainan2020datasetDescriptiveStatistics(show = 'continuous') return the correct summarytools object", {
  stats <- Tainan2020datasetDescriptiveStatistics(show = "continuous")
  expect_s3_class(stats, c("summarytools", "matrix"))
  n_vars <- sum(sapply(tainan2020dataset, is.numeric))
  expect_length(stats, 16*n_vars)
  expect_setequal(labels(stats)[[2]], c("age_years", "OS_months", "PFS_months", "radiation_dose_Gy", "radiation_volume_mL"))
})

test_that("Tainan2020datasetDescriptiveStatistics(show = 'categorical') return the correct summarytools object", {
  stats <- Tainan2020datasetDescriptiveStatistics(show = "categorical")
  expect_s3_class(stats, c("summarytools", "list"))
  n_vars <- sum(sapply(tainan2020dataset, is.factor))
  expect_length(stats, n_vars)
})

test_that("Tainan2020datasetDescriptiveStatistics(show = '') throws and return a warning", {
  expect_warning(Tainan2020datasetDescriptiveStatistics(show = ""))
})
