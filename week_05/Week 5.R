library(spData)
library(sf)
library(tidyverse)
library(units)
# library(units) #this one is optional, but can help with unit conversions.

#load 'world' data from spData package
data(world)  
# load 'states' boundaries from spData package
data(us_states)

albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

#filter the world dataset to canada
canada <- world %>%
   filter(name_long=="Canada")
canada_map <-sf::st_transform(canada,"+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs")

#filter the NYC dataset
new_york<- us_states %>%
      filter(NAME=="New York")
ny_map <- sf::st_transform(new_york,"+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs")

border_object <- st_intersection(ny_map, st_buffer(canada_map,dist = 10000))

#Intersect and Plot canada/NY border
border_map <- ggplot() +
  geom_sf(data = ny_map) +
  geom_sf(data=st_intersection(ny_map, st_buffer(canada_map,dist = 10000)), fill= "red")

  
#calculate the area of the polygon
polygon_area <- st_area(border_object) %>%
     set_units(km^2)
  

  

  
  

