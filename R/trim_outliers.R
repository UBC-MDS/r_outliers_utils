A function to generate outlier free dataset by imputing them with mean, median or trim entire row with outlier from dataset.
#'
#' @param dataframe A target dataframe where the function is performed.
#' @param columns The target columns where the function needed to be performed. Default is None, the function will check all columns.
#' @param identifier The method of identifying outliers. 
#' @param method The method of dealing with outliers. - if "trim" :  remove completely rows with data points having outliers. - if "median" : replace outliers with median values - if "mean" : replace outliers with mean values
#'
#' @return a dataframe with the summary of the outlier identified by the method
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
#'     trim_outliers(df, columns=('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm'),identifier='Z_score', method='trim')
#'    	 SepalLengthCm  	SepalWidthCm	   PetalWidthCm
#'    0	5.1	                1.4	                0.2
#'    1	4.9	                1.4	                0.2
#'    2	5.5	                2.0	                0.3
#'    3	5.1	                0.7	                0.4
#'    4	5.4	                1.2             	0.5
#'    5	5.0	                1.4	                0.6
#'    6	5.2	                1.8	                0.4
#'    7	5.3	                1.5	                0.2


trim_outliers <- function(dataframe, columns=NA, identifier='Z_score', method='trim') {

}


