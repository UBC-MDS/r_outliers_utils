## Set input for test
df <- data.frame(SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 50, 54, 5.0, 5.2, 5.3, 5.1),
                 SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                 PetalWidthCm = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5))
## Test input error
test_that("Error in input dataframe", {
  expect_error(visualize_outliers(c(1,2,3)))
})
test_that("Error in input dataframe is empty", {
  expect_error(visualize_outliers(df[FALSE,]))
})
test_that("Error in input columns", {
  expect_error(visualize_outliers(df, columns = c(1,2)))
})
test_that("Error in input type", {
  expect_error(visualize_outliers(df, type=1))
})
## Test output
test_that('Plot should use geom_violin in default and map value to x-axis, and variables to y-axis, also facet.', {
  expect_true("GeomViolin" %in% c(class(visualize_outliers(df, columns='SepalLengthCm')$layers[[1]]$geom)))
  expect_true(".data$name"  == get_expr(visualize_outliers(df, columns='SepalLengthCm')$mapping$x))
  expect_true(".data$value" == get_expr(visualize_outliers(df, columns='SepalLengthCm')$mapping$y))
  expect_true("FacetWrap" %in% c(class(visualize_outliers(df, columns='SepalLengthCm')$facet)))
})
test_that('Plot should have selected columns by default.', {
  expect_true("SepalLengthCm" %in% unique(get_expr(visualize_outliers(df,columns=c('SepalLengthCm', 'SepalWidthCm'))$data$name)))
  expect_true("SepalWidthCm" %in% unique(get_expr(visualize_outliers(df,columns=c('SepalLengthCm', 'SepalWidthCm'))$data$name)))
  expect_false("PetalWidthCm" %in% unique(get_expr(visualize_outliers(df,columns=c('SepalLengthCm', 'SepalWidthCm'))$data$name)))
})
