#Case study 4 
#Install packages 
install.packages("tidyverse")
install.packages("nycflights13")

library(tidyverse)
library(nycflights13)
library(dplyr)

#open nycflights13 help 
nycflights13

#nycflights13 tables
farthest_flight = flights %>%  
 arrange(desc(distance)) %>%
  slice(1) %>%
    inner_join(airports, by=c("dest"="faa")) %>%
    select(name)
    View(farthest_flight)
    as.character(farthest_flight)
    farthest_flight<-as.character(farthest_flight)
    
#extra time 
    airports %>%
      distinct(lon,lat) %>%
      ggplot(aes(lon, lat)) +
      borders("world") +
      geom_point(col="red") +
      coord_quickmap()
    


