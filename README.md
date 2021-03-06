
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- #region -->

# routliersutils

[![codecov](https://codecov.io/gh/UBC-MDS/r_outliers_utils/branch/main/graph/badge.svg?token=noFqX1BkyC)](https://codecov.io/gh/UBC-MDS/r_outliers_utils)
[![ci-cd](https://github.com/UBC-MDS/r_outliers_utils/actions/workflows/check-standard.yml/badge.svg)](https://github.com/UBC-MDS/r_outliers_utils/actions/workflows/check-standard.yml)

<!-- badges: start -->
<!-- badges: end -->

## Overview

As data rarely comes ready to be used and analyzed for machine learning
right away, this package aims to help speed up the process of cleaning
and doing initial exploratory data analysis specific to outliers. The
package focuses on the tasks of identifying univariate outliers,
providing summary of outliers like count, range of outliers, visualize
them and giving functionality to remove them from data.

## Installation

You can install then development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools") # run this line first if `devtools` package is not installed in your local.
devtools::install_github("UBC-MDS/r_outliers_utils")
```

## Functions

The three functions contained in this package are as follows:

-   `outlier_identifier`: A function to identify outliers in the dataset
    and provide their summary as an output
-   `visualize_outliers`: A function to generate the eda plots
    highlighting outliers providing additional functionality to
    visualize them
-   `trim_outliers`: A function to generate outlier free dataset by
    imputing them with mean, median or trim entire row with outlier from
    dataset.

## Our Place in the R Ecosystem

While R packages with similar functionalities exist, this package aims
to provide summary, visualization of outliers in a single package with
an additional functionality to generate outlier-free dataset. Few
packages with similar functionality are as follows:

-   [univOutl](https://cran.r-project.org/web/packages/univOutl/univOutl.pdf)
-   [outliers](https://cran.r-project.org/web/packages/outliers/outliers.pdf)

## Usage

The routliersutils package help you to build exploratory data analysis.

routliersutils includes multiple functions to perform initial EDA
specific to outliers. The generated output for outliers can be obtained
in the form of dataframe objects and graphical form.

The routliersutils is capable of :

-   Summarizing outliers and identify them in dataset
-   Visualize them in boxplot and violin plot
-   Trim or impute outliers with mean , median in dataset

## Documentation

Please find the detailed documentation in the
[vignette](https://ubc-mds.github.io/r_outliers_utils/).

##### Example usage to load package

``` r
library(routliersutils)
```

## Contributing

This package is authored by Karanpreet Kaur, Linhan Cai, Qingqing Song
as part of the course project in DSCI-524 (UBC-MDS program). You can see
the list of all contributors in the contributors tab.

We welcome and recognize all contributions. If you wish to participate,
please review our [Contributing guidelines](CONTRIBUTING.md)

## License

`routliersutils` is licensed under the terms of the MIT license.
<!-- #endregion -->
