library(rvest)
library(tidyverse)

  World_Cup <- read_html("https://en.wikipedia.org/wiki/FIFA_World_Cup") %>%
      html_nodes("table") %>%
      .[[4]] %>%
      html_table(fill = TRUE)%>%
      select(Year, Hosts, Matches, `Totalattendance †`, Averageattendance) %>%
      mutate(`Totalattendance`= str_remove_all(`Totalattendance †`, "†")) %>%
      select(Year, Hosts, Matches,`Totalattendance`, Averageattendance) %>%
      slice(2:23) %>%
      mutate(Totalattendance = str_replace_all(Totalattendance,
                                               pattern = "\\,",
                                               replacement = "")) %>%
      mutate(Averageattendance = str_replace_all(Averageattendance,
                                                 pattern = "\\,",
                                                 replacement = "")) %>%
      mutate(Totalattendance = as.numeric(Totalattendance)) %>%
      mutate(Averageattendance = as.numeric(Averageattendance))

  World_Cup <- World_Cup %>% mutate(WorldCup = NA)
  for(i in 1:nrow(World_Cup))
  {
    World_Cup$WorldCup[i] <- paste(World_Cup$Year[i], World_Cup$Hosts[i])
  }

  World_Cup <- World_Cup %>%
    mutate(WorldCup = str_remove_all(WorldCup, pattern = " ")) %>%
    select(WorldCup, Matches, Totalattendance, Averageattendance)



  usethis::use_data(World_Cup)
