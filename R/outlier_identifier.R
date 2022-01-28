#' A function that identify and summarize the count and range of based on the method the user choose
#'
#' @param dataframe The target dataframe(data.frame) where the function is performed
#' @param columns The target vector of columns where the function needed to be performed. Default is NULL, the function will check all columns
#' @param identifier The method of identifying outliers.
#' @param return_df Can be set to TRUE if want output as dataframe(data.frame) identified with outliers in rows
#'
#' @return A dataframe(data.frame) with the summary of the outlier identified by the method) if return_df = FALSE,
#'         A dataframe(data.frame) with additional column having if row has outlier or not) if return_df = TRUE
#' @importFrom dplyr select select_if mutate
#' @import tidyverse
#' @importFrom stats sd median IQR
#' @export
#'
#'
#' @examples
#' library(tidyverse)
#'
#' df = data.frame(SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 50, 54, 5.0, 5.2, 5.3, 5.1),
#'                           SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
#'                           PetalWidthCm = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5))
#'
#'
#' outlier_identifier(df)
outlier_identifier <- function(dataframe, columns=NULL, identifier = 'IQR', return_df=FALSE) {
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

  if(!typeof(return_df) == 'logical'){
    stop(paste0("passed return_df is of type", typeof(return_df)), ", should be bool with value as TRUE or FALSE")
  }

  if(is.null(columns)){
    columns <-  names(dataframe)
  }
  df_filtered <-  dataframe |>
    select(columns)
  numeric_columns = names(select_if(df_filtered, is.numeric))
  df_filtered <-  df_filtered |>
    select(numeric_columns) |>
    mutate(outlier = FALSE)

  output <-  data.frame(matrix(ncol = length(numeric_columns), nrow = 7))
  colnames(output) <- numeric_columns
  rownames(output) <- c('outlier_count', 'outlier_percentage', 'mean', 'median', 'std', 'lower_range', 'upper_range')

  if(identifier == 'Z_score'){
    if(return_df == FALSE){
      for(col in numeric_columns){
        std = sd(df_filtered[[col]], na.rm = TRUE)
        mean = mean(df_filtered[[col]], na.rm = TRUE)
        col_outliers = df_filtered[which(abs(df_filtered[[col]] - mean) > std*3), ]
        output['outlier_count', col] = nrow(col_outliers)
        output['outlier_percentage', col] = paste0(round((nrow(col_outliers) * 100)/nrow(df_filtered), 2), '%')
        output['mean', col] = round(mean, 2)
        output['median', col] = round(median(df_filtered[[col]], na.rm = TRUE), 2)
        output['std', col] = round(std, 2)
        low_range = col_outliers[which(col_outliers[[col]] - mean < -std*3), col]
        upper_range = col_outliers[which(col_outliers[[col]] - mean > std*3), col]


        if(!length(low_range) == 0){
          if(length(low_range) == 1){
            output['lower_range', col] = suppressWarnings(min(low_range))
          }
          else{
            output['lower_range', col] = paste0('(', suppressWarnings(min(low_range)), ',', suppressWarnings(max(low_range)), ')')
          }
        }

        if(!length(upper_range) == 0){
          if(length(upper_range) == 1){
            output['upper_range', col] = suppressWarnings(min(upper_range))
          }
          else{
            output['upper_range', col] = paste0('(', suppressWarnings(min(upper_range)), ',', suppressWarnings(max(upper_range)), ')')
          }
        }
      }

      return(output)

    }
    else{
      for(col in numeric_columns){
        std = sd(df_filtered[[col]], na.rm = TRUE)
        mean = mean(df_filtered[[col]], na.rm = TRUE)
        df_filtered[which(abs(df_filtered[[col]] - mean) > std*3), 'outlier'] = TRUE
      }

      return(df_filtered)
    }


  }

  else{
    if(return_df == FALSE){
      for(col in numeric_columns){
        std = sd(df_filtered[[col]], na.rm = TRUE)
        mean = mean(df_filtered[[col]], na.rm = TRUE)
        iqr = IQR(df_filtered[[col]], na.rm = TRUE)
        col_outliers = df_filtered[which(abs(df_filtered[[col]] - mean)/std > iqr*1.5), ]
        output['outlier_count', col] = nrow(col_outliers)
        output['outlier_percentage', col] = paste0(round((nrow(col_outliers) * 100)/nrow(df_filtered), 2), '%')
        output['mean', col] = round(mean, 2)
        output['median', col] = round(median(df_filtered[[col]], na.rm = TRUE), 2)
        output['std', col] = round(std, 2)
        low_range = col_outliers[which((col_outliers[[col]] - mean)/std < -iqr*1.5), col]
        upper_range = col_outliers[which((col_outliers[[col]] - mean)/std > iqr*1.5), col]


        if(!length(low_range) == 0){
          if(length(low_range) == 1){
            output['lower_range', col] = suppressWarnings(min(low_range))
          }
          else{
            output['lower_range', col] = paste0('(', suppressWarnings(min(low_range)), ',', suppressWarnings(max(low_range)), ')')
          }
        }

        if(!length(upper_range) == 0){
          if(length(upper_range) == 1){
            output['upper_range', col] = suppressWarnings(min(upper_range))
          }
          else{
            output['upper_range', col] = paste0('(', suppressWarnings(min(upper_range)), ',', suppressWarnings(max(upper_range)), ')')
          }
        }
      }

      return(output)

    }
    else{
      for(col in numeric_columns){
        std = sd(df_filtered[[col]], na.rm = TRUE)
        mean = mean(df_filtered[[col]], na.rm = TRUE)
        iqr = IQR(df_filtered[[col]], na.rm = TRUE)
        df_filtered[which(abs(df_filtered[[col]] - mean)/std > iqr*1.5), 'outlier'] = TRUE
      }

      return(df_filtered)
    }
  }
}
