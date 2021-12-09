#install tidyverse
install.packages("tidyverse")
load("tidyverse")
library(tidyverse)
# define the link to the data - you can try this in your browser too.  Note that the URL ends in .txt.
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"
temp=read_table(dataurl,
                skip=3, #skip the first line which has column names
                na="999.90", # tell R that 999.90 means missing in this dataset
                col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))
# renaming is necessary becuase they used dashes ("-")
# in the column names and R doesn't like that.


View(temp)
summary(temp)

#USing Esquisse to build a graph
install.packages("esquisse")

#Code from Esquisse
p1<-ggplot(temp) +
  aes(x = YEAR, y = JJA) +
  geom_line(size = 0.5, colour = "#013220") +
  labs(x = "Year", 
       y = "Average Temperature ", title = "Mean Summer Temperatures in Buffalo, NY") +
  theme_classic() +
  theme(plot.title = element_text(size = 20L, face = "bold", hjust = 0.5), axis.title.y = element_text(size = 14L, 
                                                                                                       face = "bold"), axis.title.x = element_text(size = 14L, face = "bold"))+
  geom_smooth(colour="#FF0000", fill= "#ADD8E6")

#saving my image
png("Mean_Summer_Temp_Buffalo.png")
p1
dev.off()

ggsave("Mean_Temp_Buffalo.png",width=20,height=10)







