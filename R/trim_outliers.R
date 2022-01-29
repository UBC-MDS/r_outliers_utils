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

```{r}
trim_outliers <- function(dataframe, columns=NULL, identifier='Z_score', method='trim') {
  
  
  if (!is.data.frame(dataframe)) {
    stop("The argument dataframe is not dataframe")
  }
  
  # check if there is non-numeric column
  if (is.null(columns)) {
    if (sum(unlist(lapply(dataframe, is.numeric))) != length(dataframe)) {
      stop("there is non-numeric column in dataframe")
    }
  } else {
    if (!is.vector(columns)) {
      stop("Argument columns must be a vector")
    }
    possible_numeric_col <-
      dataframe %>% select_if(is.numeric) %>% colnames()
    for (col in columns) {
      if (!(col %in% possible_numeric_col)) {
        stop("The given columns contains non-numeric columns in this dataframe.")
      }
    }
  }
  
  # check if method input is valid
  if (!method %in% c("trim", "median", "mean")) {
    stop("The given method must be one of ('trim', 'median', 'mean')")
  }
  
  df_cp <- data.frame(dataframe)
  if (is.null(columns)) {
    columns <- names(df_cp)
  }
  
  outlier_index <- c()
  
  for (col in columns) {
    current_col <- df_cp[col]
    col_mean <- apply(current_col, 2, mean)
    col_std <- apply(current_col, 2, sd)
    threshold <- 2.5
    
    
    for (i in 1:nrow(df_cp)) {
      current_item <- current_col[i, ]
      z = (current_item - col_mean) / col_std
      if (z >= threshold) {
        if (!i %in% outlier_index) {
          outlier_index <- c(outlier_index, i)
        }
        if (method == "mean") {
          df_cp[i, col] = round(col_mean, 2)
        }
        if (method == "median") {
          df_cp[i, col] = apply(current_col, 2, median)
        }
      }
    }
  }
  
  if (method == "trim" & !is.null(outlier_index)) {
    df_cp <- df_cp[-outlier_index,]
  }
  
  row.names(df_cp) <- NULL
  
  return(df_cp)
}
```