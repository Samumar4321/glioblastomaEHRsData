library(testthat)
library(glioblastomaEHRsData)

test_that("plotTainan2020dataset() gives an error because there are no variables", {
  expect_error(plotTainan2020dataset())
})

test_that("plotTainan2020dataset('var1') gives an error because there isn't a variable with such name", {
  expect_warning(plotTainan2020dataset('var1'))
})

test_that("plotTainan2020dataset('age_years', 'var2') gives an error because there isn't a variable with such name", {
  expect_warning(plotTainan2020dataset('age_years', 'var2'))
})

test_that("plotTainan2020dataset('age_years', 'OS_months', 'plots') gives the error 'Directory not found' but returns the plot", {
  expect_warning(plot <- plotTainan2020dataset('age_years', 'OS_months', 'plots'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotTainan2020dataset('age_years') returns the 1D histogram plot", {
  expect_no_warning(plot <- plotTainan2020dataset('age_years'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotTainan2020dataset('chemo_yes1_no0') returns the 1D bar plot", {
  expect_no_warning(plot <- plotTainan2020dataset('chemo_yes1_no0'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotTainan2020dataset('age_years', 'OS_months', 'tainan_plot.pdf') returns and save the 2D boxplot plot in the working dir", {
  expect_no_warning(plot <- plotTainan2020dataset('age_years', 'OS_months', 'tainan_plot.pdf'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotTainan2020dataset('chemo_yes1_no0', 'OS_months', 'images') returns and save the 2D boxplot plot with the user's name", {
  path <- testthat::test_path("images", "2dOSvsChemo.png")
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  expect_no_warning(plot <- plotTainan2020dataset('chemo_yes1_no0', 'OS_months', path))
  expect_s3_class(plot, c('gg', 'ggplot'))
})

test_that("plotTainan2020dataset('chemo_yes1_no0', 'TMZ_based_chemo_yes1_no0') returns and save the 2D bar plot", {
  expect_no_warning(plot <- plotTainan2020dataset('chemo_yes1_no0', 'TMZ_based_chemo_yes1_no0'))
  expect_s3_class(plot, c('gg', 'ggplot'))
})
