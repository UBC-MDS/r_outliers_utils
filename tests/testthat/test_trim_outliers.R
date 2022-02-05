test_df = data.frame(SepalLengthCm = c(5.2, 4.9, 4.7, 5.5, 5.1, 5.0, 6.0, 54, 50, 5.3, 5.1),
                     SepalWidthCm = c(-5.4, 1.4, -5.7, 0.2, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                     PetalWidthCm = c(-40, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                     class = c('Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica',
                               'Iris Setosa', 'Iris Versicolour', 'Iris Setosa', 'Iris Versicolour'))

test_column = c('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm')

median_output = data.frame(SepalLengthCm = c(5.2, 4.9, 4.7, 5.5, 5.1, 5.0, 6.0, 5.2, 5.2, 5.3, 5.1),
                           SepalWidthCm = c(1.4, 1.4, 1.4, 0.2, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                           PetalWidthCm = c(0.3, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 0.3),
                           class = c('Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica',
                                     'Iris Setosa', 'Iris Versicolour', 'Iris Setosa', 'Iris Versicolour'))

trim_output = data.frame(SepalLengthCm = c(4.9, 5.5, 5.1, 5.0, 6.0, 5.3),
                         SepalWidthCm = c(1.4, 0.2, 0.7, 1.6, 1.2, 1.5),
                         PetalWidthCm = c(0.2, 0.3, 0.2, 0.5, 0.5, 0.2),
                         class = c('Iris Versicolour', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica',
                                   'Iris Setosa'),
                         row.names = c('2','4', '5', '6', '7', '10'))



mean_output = data.frame(SepalLengthCm = c(5.2, 4.9, 4.7, 5.5, 5.1, 5.0, 6.0, 13.71, 13.71, 5.3, 5.1),
                         SepalWidthCm = c(0.07, 1.4, 0.07, 0.2, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                         PetalWidthCm = c(-2.9, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, -2.9),
                         class = c('Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica',
                                   'Iris Setosa', 'Iris Versicolour', 'Iris Setosa', 'Iris Versicolour'))


# dataframe argument test
test_that("Dataframe arument must be a data.frame", {
  expect_error(trim_outliers("123", columns = test_column, "mean"))
  expect_error(trim_outliers(c(1), columns = test_column, "mean"))
})

# columns argument test
test_that(
  "Columns argument is not vector of column names, or contains non-existing or non-numeric columns",
  {
    expect_error(trim_outliers(test_df, columns = c(1, 2, 3), "mean"))
    expect_error(trim_outliers(test_df, columns = c('Species'), "mean"))
    expect_error(trim_outliers(test_df, columns = test_df, method =  "mean"))
  }
)

# method argument test
test_that("selected method is not one of c('trim', 'median', 'mean')", {
  expect_error(trim_outliers(test_df, columns = test_column, method = "bro"))
  expect_error(trim_outliers(test_df, columns = test_column, method = 123))
})

# test for value equal
test_that("The outlier function has error values", {
  expect_true(all.equal(
    rownames(trim_outliers(test_df, columns = test_column)),
    rownames(trim_output)
  ))

  expect_true(all.equal(
    trim_outliers(test_df, columns = test_column, method = "median"),
    median_output
  ))
  expect_true(all.equal(
    trim_outliers(test_df, columns = test_column, method = "mean"),
    mean_output
  ))
})
