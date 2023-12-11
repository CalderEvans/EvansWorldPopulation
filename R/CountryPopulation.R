#' Documentation for CountryPopulation
#'
#' CountryPopulation is a function that takes the input of a country and returns
#' a graph of that country's population from 1950 to 2020.
#'
#'
#' @param a An official Country's offical name
#' @return A graph of a country's population from 1950 to 2020
#' @examples
#' CountryPopulation("United States of America")
#' CountryPopulation("Russia")
#' CountryPopulation("China")
#' CountryPopulation("United Kingdom")
#' @export
CountryPopulation <- function(country)
{
  if(!(country %in% WorldPopulation$Country))
  {
    stop("You must use an official name of a country.")
  }
  else
  {
    WorldPopulation <- WorldPopulation %>% pivot_longer(
      "1950":"2020",
      names_to = "Year",
      values_to = "Population"                         ) %>%
      mutate(Year = as.numeric(Year)) %>%
      mutate(Population= as.numeric(Population))

    CountryPop.graph <- WorldPopulation %>%
      filter(Country == country) %>%
      ggplot(aes(x = Year, y = Population)) +
      geom_point() +
      labs(y = "Population (in thousands)",
           title = paste(country, "Population from 1950 to 2020"))
    return(CountryPop.graph)
  }
}
