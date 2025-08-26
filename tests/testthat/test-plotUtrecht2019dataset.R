library(testthat)
library(glioblastomaEHRsData)

test_that("plotUtrecht2019dataset() gives an error because there are no variables", {
  expect_error(plotUtrecht2019dataset())
})

test_that("plotUtrecht2019dataset('var1') gives an error because there isn't a variable with such name", {
  expect_warning(plotUtrecht2019dataset('var1'))
})

test_that("plotUtrecht2019dataset('age_years', 'var2') gives an error because there isn't a variable with such name", {
  expect_warning(plotUtrecht2019dataset('age_years', 'var2'))
})

test_that("plotUtrecht2019dataset('age_years', 'OS_months', 'plots') gives the error 'Directory not found' but returns the plot", {
  expect_warning(plot <- plotUtrecht2019dataset('age_years', 'OS_months', 'plots'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotUtrecht2019dataset('age_years') returns the 1D histogram plot", {
  expect_no_warning(plot <- plotUtrecht2019dataset('age_years'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotUtrecht2019dataset('KPS_less70.0_more70.1') returns the 1D bar plot", {
  expect_no_warning(plot <- plotUtrecht2019dataset('KPS_less70.0_more70.1'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotUtrecht2019dataset('age_years', 'OS_months', 'utrecht_plot.pdf') returns and save the 2D boxplot plot in the working dir", {
  expect_no_warning(plot <- plotUtrecht2019dataset('age_years', 'OS_months', 'utrecht_plot.pdf'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotUtrecht2019dataset('KPS_less70.0_more70.1', 'OS_months', 'images') returns and save the 2D boxplot plot with the user's name", {
  path <- testthat::test_path("images", "2dOSvsKPS.png")
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  expect_no_warning(plot <- plotUtrecht2019dataset('KPS_less70.0_more70.1', 'OS_months', path))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotUtrecht2019dataset('KPS_less70.0_more70.1', 'surgery_biopsy0_resection1') returns and save the 2D bar plot", {
  expect_no_warning(plot <- plotUtrecht2019dataset('KPS_less70.0_more70.1', 'surgery_biopsy0_resection1'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})
