#'A function to generate outlier free dataset by imputing them with mean, median or trim entire row with outlier from dataset.
#'
#' @param dataframe A target dataframe where the function is performed.
#' @param columns The target columns where the function needed to be performed. Default is None, the function will check all columns.
#' @param identifier The method of identifying outliers.
#' @param method The method of dealing with outliers. - if "trim" :  remove completely rows with data points having outliers. - if "median" : replace outliers with median values - if "mean" : replace outliers with mean values
#'
#' @return a dataframe with the summary of the outlier identified by the method
#' @importFrom dplyr select select_if mutate
#' @import tidyverse
#' @importFrom stats sd median IQR
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
#'trim_outliers(df,identifier='Z_score', method='trim')
trim_outliers <- function(dataframe, columns=NULL, identifier='IQR', method='trim') {
  if(!is.data.frame(dataframe)){
    stop(paste0("passed dataframe is of type", typeof(dataframe), ", should be DataFrame"))
  }

  if(is.na.data.frame(dataframe)[1] == TRUE){
    stop(paste0("passed dataframe is None"))
  }

  if((!is.null(columns)) & (!is.character(columns))){
    stop(paste0("passed columns is of type", typeof(columns), ", should be character vector or NULL"))
  }

  if((!is.character(identifier))){
    stop(paste0("passed identifier is of type", typeof(identifier), ", should be character string with value 'Z_score' or 'IQR'"))
  }

  if(identifier!='Z_score' & identifier!='IQR'){
    stop(paste0("passed identifier should have value 'Z_score' or 'IQR'"))
  }
  # check if method input is valid
  if (!method %in% c("trim", "median", "mean")) {
    stop("The given method must be one of ('trim', 'median', 'mean')")
  }
  df_cp <- dataframe

  if(is.null(columns)){
    columns <-  names(dataframe)
  }
  df_filtered <-  dataframe |>
    select(columns)
  numeric_columns = names(select_if(df_filtered, is.numeric))

  df = outlier_identifier(df_filtered, columns=numeric_columns, identifier=identifier, return_df = TRUE)

  if(method == 'trim'){
    outlier_index <- c(rownames(df[which(df$outlier == TRUE), ]))
    if(length(outlier_index) >= 1){
      df_cp <- df_cp[-which(df$outlier == TRUE), ]
    }

  }

  else if(method == 'mean'){
    for(col in numeric_columns){
      df_col = outlier_identifier(dataframe, columns=col, identifier=identifier, return_df = TRUE)
      outlier_index <- c(rownames(df_col[which(df_col$outlier == TRUE), ]))
      df_cp[outlier_index, ][col] = round(mean(dataframe[[col]], na.rm = TRUE), 2)
    }

  }
  else if(method == 'median'){
    for(col in numeric_columns){
      df_col = outlier_identifier(dataframe, columns=col, identifier=identifier, return_df = TRUE)
      outlier_index <- c(rownames(df_col[which(df_col$outlier == TRUE), ]))
      df_cp[outlier_index, ][col] = round(median(dataframe[[col]], na.rm = TRUE), 2)
    }

  }
  return(df_cp)
}
