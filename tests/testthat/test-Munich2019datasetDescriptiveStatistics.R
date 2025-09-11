library(testthat)
library(glioblastomaEHRsData)

test_that("Munich2019datasetDescriptiveStatistics() return a list of 2 named elements", {
  skip_if_not(capabilities("tcltk"), "Tk non disponibile")
  stats <- Munich2019datasetDescriptiveStatistics()
  expect_type(stats, "list")
  expect_length(stats, 2)
  expect_named(stats, expected = c("continuous", "categorical"))
})

test_that("Munich2019datasetDescriptiveStatistics(show = 'all') return a list of 2 named elements", {
  skip_if_not(capabilities("tcltk"), "Tk non disponibile")
  stats <- Munich2019datasetDescriptiveStatistics(show = "all")
  expect_type(stats, "list")
  expect_length(stats, 2)
  expect_named(stats, expected = c("continuous", "categorical"))
})

test_that("Munich2019datasetDescriptiveStatistics(show = 'continuous') return the correct summarytools object", {
  skip_if_not(capabilities("tcltk"), "Tk non disponibile")
  stats <- Munich2019datasetDescriptiveStatistics(show = "continuous")
  expect_s3_class(stats, c("summarytools", "matrix"))
  n_vars <- sum(sapply(munich2019dataset, is.numeric))
  expect_length(stats, 16*n_vars)
  expect_setequal(labels(stats)[[2]], c("age_years", "OS_months", "PFS_months"))
})

test_that("Munich2019datasetDescriptiveStatistics(show = 'categorical') return the correct summarytools object", {
  skip_if_not(capabilities("tcltk"), "Tk non disponibile")
  stats <- Munich2019datasetDescriptiveStatistics(show = "categorical")
  expect_s3_class(stats, c("summarytools", "list"))
  n_vars <- sum(sapply(munich2019dataset, is.factor))
  expect_length(stats, n_vars)
})

test_that("Munich2019datasetDescriptiveStatistics(show = '') throws and return a warning", {
  expect_warning(Munich2019datasetDescriptiveStatistics(show = ""))
})
