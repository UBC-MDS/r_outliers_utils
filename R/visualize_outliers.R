#' A function that plot out the given data with outliers marked.
#'
#' @param dataframe A target dataframe where the function is performed.
#' @param columns The target columns where the function needed to be performed. Default is None, the function will check all columns.
#' @param type The method of plotting the distribution.
#'
#' @return A ggplot of data distribution.
#' @import tidyverse
#' @import tibble
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @export
#'
#' @examples
#'
#' library(tidyverse)
#' library(ggplot2)
#'
#' df <- tibble(cola=c(1:5), colb=c(6:10), colc=c(11:15))
#' visualize_outliers(df, columns=c("cola", "colb"), type="violin")

visualize_outliers <- function(dataframe, columns=NULL, type='violin') {

  ## Handle dataframe type error (Check if input is a dataframe)
  if (!is.data.frame(dataframe) & !is_tibble(dataframe)) {
    stop("Passed dataframe should be DataFrame or tibble.")
  }

  ## Handle empty dataframe or dataframe with all NAN
  if (nrow(dataframe) == 0) {
    stop("Passed dataframe is None.")
  }

  ## Handle columns type error (Check if columns are None or type character)
  if (!is.null(columns) & !is.character(columns)) {
    stop("Passed columns should be list or NoneType.")
  }

  ## Handle type Value error (Check if type has value 'violin' or 'boxplot')
  if (type != 'violin' & type != 'boxplot') {
    stop("Passed type should have value 'violin' or 'boxplot'.")
  }

  ## Check columns
  if (is.null(columns)){
    columns <- names(dataframe)
  }

  df_filtered <-  dataframe |>
    select(columns)

  numeric_columns = names(select_if(df_filtered, is.numeric))

  ## Pivot dataframe
  dataframe <- df_filtered |>
    select(numeric_columns) |>
    pivot_longer(cols=numeric_columns)

  ## Check type and plot
  if (type == 'violin') {
    p <- ggplot(dataframe, aes(.data$name, .data$value)) +
      geom_violin(aes(fill = .data$name)) +
      facet_wrap(facets = ~.data$name, ncol = 4) +
      labs(y = "Value", x = "Variables") +
      ggtitle("Data distribution") +
      theme_bw()+
      theme(axis.text.x = element_text(angle = 90),
            legend.position = "none")
  } else if (type == 'boxplot') {
    p <- ggplot(dataframe, aes(.data$name, .data$value)) +
      geom_boxplot(aes(fill = .data$name)) +
      facet_wrap(facets = ~.data$name, ncol = 4) +
      labs(y = "Value", x = "Variables") +
      ggtitle("Data distribution") +
      theme_bw()+
      theme(axis.text.x = element_text(angle = 90),
            legend.position = "none")
  }

  ## Return plot
  p

}
