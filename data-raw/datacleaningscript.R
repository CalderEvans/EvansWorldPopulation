library(tidyverse)
library(readxl)

  WorldPopulation <- read_excel("data-raw/World_Population.xlsx",
                                  sheet = "ESTIMATES") %>%
      slice(-c(1:11, 13:38)) %>%
      select(-...2, -`United Nations`, -...4, -...5, -...7) %>%
      filter(!str_detect(...6, "Subregion|SDG region|SDG subregion")) %>%
      select(-...6)

      colnames(WorldPopulation) <- WorldPopulation[1, ]

      WorldPopulation <- WorldPopulation %>%
        slice(-1) %>%
        rename(Country = `Region, subregion, country or area *`)

      usethis::use_data(WorldPopulation)
