#' A function that identify and summarize the count and range of based on the method the user choose
#'
#' @param dataframe The target dataframe(data.frame) where the function is performed
#' @param columns The target vector of columns where the function needed to be performed. Default is NULL, the function will check all columns
#' @param identifier The method of identifying outliers.
#' @param return_df Can be set to TRUE if want output as dataframe(data.frame) identified with outliers in rows
#'
#' @return A dataframe(data.frame) with the summary of the outlier identified by the method) if return_df = FALSE,
#'         A dataframe(data.frame) with additional column having if row has outlier or not) if return_df = TRUE
#' @export
#'
#' @examples
#' library(tidyverse)
#'
#' df = as.data.frame(tibble(SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 50, 54, 5.0, 5.2, 5.3, 5.1),
#'                           SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
#'                           PetalWidthCm = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5))
#'                   )
#'
#'outlier_identifier(df)
#'                    SepalLengthCm SepalWidthCm PetalWidthCmoutlier_count                  2            1            1
#'outlier_percentage        18.18%        9.09%        9.09%
#'mean                       13.63         3.19         0.77
#'median                       5.1          1.5          0.4
#'std                        18.99         5.59         1.41
#'lower_range                  NaN          NaN          NaN
#'upper_range         (50.0, 54.0)         20.0          5.0
#'

outlier_identifier <- function(dataframe, columns=NULL, identifier = 'IQR', return_df=FALSE) {

}
