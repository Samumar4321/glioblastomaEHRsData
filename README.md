# glioblastomaEHRsData

<!-- badges: start -->
[![Rhub](https://github.com/Samumar4321/glioblastomaEHRsData/actions/workflows/rhub.yaml/badge.svg)](https://github.com/Samumar4321/glioblastomaEHRsData/actions/workflows/rhub.yaml)
[![R-CMD-check.yaml](https://github.com/Samumar4321/glioblastomaEHRsData/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/Samumar4321/glioblastomaEHRsData/actions/workflows/check-standard.yaml)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/glioblastomaEHRsData)](https://cran.r-project.org/package=glioblastomaEHRsData)
<!-- badges: end -->

R package for generating descriptive statistics in forms of tables and plots for 3 specific datasets containing information about patients suffering from Glioblastoma Multiforme (GM).

## Datasets

### Munich2019dataset

>The dataset can be found **_[here](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0248612)_** with the relative study and relevant information.

### Tainan2020dataset

>The dataset can be found **_[here](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0233188)_** with the relative study and relevant information.

### Utrecht2020dataset

>The dataset can be found **_[here](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0222717)_** with the relative study and relevant information.

## Installation
The most common way to install R packages is through CRAN:
``` r
# The best way to install the package is using the CRAN mirror
install.packages("glioblastomaEHRsData")

# To load the package after installation
library(glioblastomaEHRsData)
```

The Github version of the package can be installed using the devtools package:
``` r
# Using devtools to install the package from GitHub
install.packages("devtools")
devtools::install_github("username/glioblastomaEHRsData")
```

Or even using a tar.gz version of the package built by yourself, even if it is not recommended.