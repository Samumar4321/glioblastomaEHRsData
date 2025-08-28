library(testthat)
library(glioblastomaEHRsData)

test_that("plotMunich2019dataset() gives an error because there are no variables", {
  expect_error(plotMunich2019dataset())
})

test_that("plotMunich2019dataset('var1') gives an error because there isn't a variable with such name", {
  expect_warning(plotMunich2019dataset('var1'))
})

test_that("plotMunich2019dataset('age_years', 'var2') gives an error because there isn't a variable with such name", {
  expect_warning(plotMunich2019dataset('age_years', 'var2'))
})

test_that("plotMunich2019dataset('age_years', 'OS_months', 'plots') gives the error 'Directory not found' but returns the plot", {
  path <- file.path(tempdir(), "plots")
  expect_warning(plot <- plotMunich2019dataset('age_years', 'OS_months', path))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotMunich2019dataset('age_years') returns the 1D histogram plot", {
  expect_no_warning(plot <- plotMunich2019dataset('age_years'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotMunich2019dataset('cHsp70_low0_high1') returns the 1D bar plot", {
  expect_no_warning(plot <- plotMunich2019dataset('cHsp70_low0_high1'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotMunich2019dataset('age_years', 'OS_months', 'images') returns and save the 2D boxplot plot with the default filename", {
  path <- file.path(tempdir(), 'images')
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  expect_no_warning(plot <- plotMunich2019dataset('age_years', 'OS_months', path))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotMunich2019dataset('cHsp70_low0_high1', 'OS_months', 'images/2dOSvscHsp70.png') returns and save the 2D boxplot plot with the user's name", {
  path <- file.path(tempdir(), 'images/2dOSvscHsp70.png')
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  expect_no_warning(plot <- plotMunich2019dataset('cHsp70_low0_high1', 'OS_months', path))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotMunich2019dataset('cHsp70_low0_high1', 'tumor_progression_yes1_no0') returns the 2D bar plot", {
  expect_no_warning(plot <- plotMunich2019dataset('cHsp70_low0_high1', 'tumor_progression_yes1_no0'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})
