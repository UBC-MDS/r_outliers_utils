
<!-- README.md is generated from README.Rmd. Please edit that file -->

#routliersutils
## Overview

<!-- badges: start -->
<!-- badges: end -->

As data rarely comes ready to be used and analyzed for machine learning right away, this package aims to help speed up the process of cleaning and doing initial exploratory data analysis specific to outliers. The package focuses on the tasks of identifying univariate outliers, providing summary of outliers like count, range of outliers, visualize them and giving functionality to remove them from data.

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

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(routliersutils)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

## Usage

- TODO

## Contributing

This package is authored by Karanpreet Kaur, Linhan Cai, Qingqing Song as part of the course project in DSCI-524 (UBC-MDS program). You can see the list of all contributors in the contributors tab.

We welcome and recognize all contributions. If you wish to participate, please review our [Contributing guidelines](CONTRIBUTING.md)

## License

`routliersutils` was created by Karanpreet Kaur, Linhan Cai, Qingqing Song. It is licensed under the terms of the MIT license.

