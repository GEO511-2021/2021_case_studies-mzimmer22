Case Study 08
================
Marissa Zimmer
October 28th, 2021

install.packages(“tidyverse”) install.packages(“knitr”)
install.packages(“kableExtra”)

library(tidyverse) library(knitr) library(kableExtra)

url \<-
(“<ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_annmean_mlo.txt>”)

DATA \<- read_table(url, skip = 57, col_names = c(“year”, “mean”,
“unc”))

ggplot(data=DATA, mapping=aes( x=year, y=mean))+ geom_line(color=“red”,
size =2)+ xlab(“Year”)+ ylab(“Manual loa Annual Mean CO_2(ppm)”)

top_5 \<- DATA %>% arrange (desc(mean)) %>% top_n(mean, n=5)

knitr::kable(top_5)
