df_zscore = data.frame(SepalLengthCm = c(5.1, 9, 6.5, 5.5, 6.7, 10.4, -54, 15, 5.2, 5.3, 5.1, 5.1, 4.9, 5.6, 6.5, 5.5, 6.7, 10.4, -55, 15, 5.2, 5.3, 5.1),
                          SepalWidthCm = c(5.1, 9, 6.5, 5.5, 6.7, 10.4, 68, 15, 5.2, 5.3, 5.1, 5.1, 4.9, 5.6, 6.5, 5.5, 6.7, 10.4, 70, 15, 5.2, 5.3, 5.1),
                          PetalWidthCm = c(-40, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5, 6, 7, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                          RootLengthCm = c(60, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5, 6, 7, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                          class = c('Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica',
                                    'Iris Setosa', 'Iris Versicolour', 'Iris Setosa', 'Iris Versicolour', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica',
                                    'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica', 'Iris Setosa', 'Iris Versicolour', 'Iris Setosa',
                                    'Iris Versicolour', 'Iris Setosa'))



df_iqr = data.frame(SepalLengthCm = c(5.2, 4.9, 4.7, 5.5, 5.1, 5.0, 6.0, 54, 50, 5.3, 5.1),
                              SepalWidthCm = c(-5.4, 1.4, -5.7, 0.2, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                              PetalWidthCm = c(-40, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                              class = c('Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Setosa', 'Iris Versicolour', 'Iris Virginica', 'Iris Virginica',
                                        'Iris Setosa', 'Iris Versicolour', 'Iris Setosa', 'Iris Versicolour'))


summary_Zscore = data.frame(SepalLengthCm = c(2, '8.7%', 1.74, 5.5, 17.99, paste0('(-55,-54)'), NA),
                        SepalWidthCm  = c(2, '8.7%', 12.48, 5.6, 18.08, NA, paste0('(68,70)')),
                        PetalWidthCm = c(1, '4.35%', -0.47, 0.4, 8.87, -40.0, NA),
                        RootLengthCm = c(1, '4.35%', 3.88, 0.4, 12.42, NA, 60.0),
                        row.names=c('outlier_count', 'outlier_percentage', 'mean', 'median', 'std', 'lower_range', 'upper_range'))

summary_IQR = data.frame(SepalLengthCm = c(2, '18.18%', 13.71, 5.2, 18.96, NA, paste0('(50,54)')),
                            SepalWidthCm = c(2, '18.18%', 0.07, 1.4, 2.83, paste0('(-5.7,-5.4)'), NA),
                            PetalWidthCm= c(2, '18.18%', -2.9, 0.3, 12.38, -40, 5.0),
                            row.names=c('outlier_count', 'outlier_percentage', 'mean', 'median', 'std', 'lower_range', 'upper_range'))

outlier_Zscore = data.frame(SepalLengthCm = c(5.1, 9, 6.5, 5.5, 6.7, 10.4, -54, 15, 5.2, 5.3, 5.1, 5.1, 4.9, 5.6, 6.5, 5.5, 6.7, 10.4, -55, 15, 5.2, 5.3, 5.1),
                            SepalWidthCm = c(5.1, 9, 6.5, 5.5, 6.7, 10.4, 68, 15, 5.2, 5.3, 5.1, 5.1, 4.9, 5.6, 6.5, 5.5, 6.7, 10.4, 70, 15, 5.2, 5.3, 5.1),
                            PetalWidthCm = c(-40, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5, 6, 7, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                            RootLengthCm = c(60, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5, 6, 7, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                            outlier = c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE))

outlier_IQR = data.frame(SepalLengthCm = c(5.2, 4.9, 4.7, 5.5, 5.1, 5.0, 6.0, 54, 50, 5.3, 5.1),
                         SepalWidthCm = c(-5.4, 1.4, -5.7, 0.2, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
                         PetalWidthCm = c(-40, 0.2, 0.2, 0.3, 0.2, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
                         outlier = c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE)
)


# Tests whether data is not of dataframe raises TypeError
test_that("dataframe arument must be a data.frame", {
  expect_error(outlier_identifier("123"))
  expect_error((outlier_identifier(c(4, NULL, 4, 7))), "passed dataframe is of typedouble, should be DataFrame")
})

# Tests whether empty dataframe raises ValueError
test_that("empty dataframe raises ValueError", {
  expect_error((outlier_identifier(data.frame(NA))), "passed dataframe is None")
})

# Tests whether columns passed in incorrect type raises TypeError
test_that("columns are None or type list", {
  expect_error(outlier_identifier(df_iqr, columns = c(123)), "passed columns is of typedouble, should be character vector or NULL")
  expect_error(outlier_identifier(df_iqr, columns = df_iqr), "passed columns is of typelist, should be character vector or NULL")
})

# Tests whether if identifier is a character str
test_that("identifier is a character str", {
  expect_error((outlier_identifier(df_iqr, identifier=123)), "passed identifier is of typedouble, should be character string with value 'Z_score' or 'IQR'")
})

# Tests whether wrong identifier passed raises ValueError
test_that("wrong identifier passed raises ValueError", {
  expect_error((outlier_identifier(df_iqr, identifier='both')), "passed identifier should have value 'Z_score' or 'IQR'")
})

# Tests whether return_df passed in incorrect type raises TypeError
test_that("return_df passed in incorrect type raises TypeError", {
  expect_error((outlier_identifier(df_iqr, identifier='Z_score',  return_df = 'True')), "passed return_df is of typecharacter, should be bool with value as TRUE or FALSE")
})

## Unit test cases

# Test if output with identifier = 'Z_score' and return_df = FALSE (default) matches with expected output summary_Zscore
# (checks if condition - 1)
expect_true(all.equal(outlier_identifier(df_zscore, identifier = 'Z_score'), summary_Zscore))


# Test if output with identifier = 'Z_score' and return_df = TRUE matches with expected output outlier_Zscore
# (checks if condition - 2)
expect_true(all.equal(outlier_identifier(df_zscore, identifier = 'Z_score', return_df = TRUE), outlier_Zscore))

# Test if output with identifier = 'IQR' (default) and return_df = FALSE (default) matches with expected output summary_IQR
# (checks if condition - 3)
expect_true(all.equal(outlier_identifier(df_iqr), summary_IQR))

# Test if output with identifier = 'IQR' (default) and return_df = TRUE matches with expected output outlier_IQR
# (checks if condition - 4)
expect_true(all.equal(outlier_identifier(df_iqr, return_df = TRUE), outlier_IQR))
