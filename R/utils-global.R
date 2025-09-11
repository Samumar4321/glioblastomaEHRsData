#'  Declarations for glibal variables
#'
#'  This file is used to suppress global variables NOTEs while running 'R CMD check',
#'  these variables are used as internal datasets in the package functions.
#'  They are declared in the 'data/' folder and are automatically loaded using
#'  'lazydata = TRUE'
#'
#'  @keywords internal
#'  @name global_variables
global_variables <- NULL

utils::globalVariables(c(
  "munich2019dataset",
  "tainan2020dataset",
  "utrecht2019dataset"
))
