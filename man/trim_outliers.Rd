% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trim_outliers.R
\name{trim_outliers}
\alias{trim_outliers}
\title{A function to generate outlier free dataset by imputing them with mean, median or trim entire row with outlier from dataset.}
\usage{
trim_outliers(dataframe, columns = NULL, identifier = "IQR", method = "trim")
}
\arguments{
\item{dataframe}{A target dataframe where the function is performed.}

\item{columns}{The target columns where the function needed to be performed. Default is None, the function will check all columns.}

\item{identifier}{The method of identifying outliers.}

\item{method}{The method of dealing with outliers. - if "trim" :  remove completely rows with data points having outliers. - if "median" : replace outliers with median values - if "mean" : replace outliers with mean values}
}
\value{
a dataframe with the summary of the outlier identified by the method
}
\description{
A function to generate outlier free dataset by imputing them with mean, median or trim entire row with outlier from dataset.
}
\examples{
library(tidyverse)

df = as.data.frame(tibble(SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 50, 54, 5.0, 5.2, 5.3, 5.1),
                          SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                          PetalWidthCm = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5))
                  )

trim_outliers(df,identifier='Z_score', method='trim')
}
