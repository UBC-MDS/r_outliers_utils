
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- #region -->

# routliersutils

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

You can install the released version of routliersutils from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("routliersutils")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
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

-   TODO

## Contributing

This package is authored by Karanpreet Kaur, Linhan Cai, Qingqing Song
as part of the course project in DSCI-524 (UBC-MDS program). You can see
the list of all contributors in the contributors tab.

We welcome and recognize all contributions. If you wish to participate,
please review our [Contributing guidelines](CONTRIBUTING.md)

## License

`routliersutils` is licensed under the terms of the MIT license.
<!-- #endregion -->
