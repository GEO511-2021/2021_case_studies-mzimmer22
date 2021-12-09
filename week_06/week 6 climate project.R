library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(ncdf4)
library(dplyr)

#Worldclim data 
data(world)  
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)


# Prepare country polgon data
world_1 <- world%>%
  filter(continent!="Antarctica")

world_1 <-as(world_1,"Spatial")

# Prepare climate data 
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)

# Plot monthly max temp 
plot(tmax_monthly)

# converting to degrees C
gain(tmax_monthly) <- 0.1

# Annual max temp 
tmax_annual <- max(tmax_monthly)
names(tmax_annual) <- "tmax"

# Calculate the Max temp observed in each country
country_max_temp <-raster::extract(x=tmax_annual,y= world_1, 
                                   fun=max,na.rm=T, small=T, sp=T)
country_max_temp_1 <-st_as_sf(country_max_temp)

# graphing the data
ggplot(country_max_temp_1)+geom_sf(aes(fill=tmax))+
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")+
  theme(legend.position = 'bottom')

# hottest county in each continent 
table <- country_max_temp_1 %>%
      st_set_geometry(NULL) %>%
      group_by(continent) %>%
      select(name_long, continent, tmax) %>%
      top_n(1) %>%
      arrange(desc(tmax)) 


