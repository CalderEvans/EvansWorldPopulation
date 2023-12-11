library(testthat)

test_that("The country named entered is in the data set",
          {
              expect_error(CountryPopulation("USA"))
              expect_error(CountryPopulation("USSR"))
              expect_error(CountryPopulation("Neverland"))
              expect_error(CountryPopulation("Moon"))
              expect_error(CountryPopulation("Alderaan"))
              expect_error(CountryPopulation("Tatooine"))
          }
)
