 #Wealth over time 
library(gapminder)
library(ggplot2)
library(dplyr)
data <-gapminder
data <-filter(data, country!='Kuwait')

#plot 1
up<- ggplot(data = data, aes(x=year, y=gdpPercap)) + 
  geom_point(aes(color=continent, size=pop/100000))+ 
   facet_wrap(~year,nrow=1) +
    scale_y_continuous(trans = "sqrt") 

#prepare data for the second plot
gapminder_continent<-data%>%
  group_by ( continent, year)%>%
  summarize (gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
    pop = sum(as.numeric(pop)))

#Plot 2
down <-ggplot(data = data, aes(x=year, y=gdpPercap)) +
  geom_line(aes(color=continent, group = country)) + 
  geom_point(aes(color=continent)) + 
  geom_line(data=gapminder_continent, 
            mapping = aes( x=year, y=gdpPercapweighted))+ 
  geom_point(data=gapminder_continent,
             mapping = aes(x=year, y=gdpPercapweighted, size=pop)) +
  facet_wrap(~continent,nrow=1)+
  theme_bw()+
  xlab("year")+
  ylab("GPD Per Capita")+
  labs(size='Population (100K)')
  
#Saving Plot #1 & #2
ggsave("case_study_3.png", width=15)




