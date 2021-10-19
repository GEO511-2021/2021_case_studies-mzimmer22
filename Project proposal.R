# Introduction to problem/question
Within New York State many have been asking the question of, where are all the wild turkeys
within NYS? Some areas we have seen an increase over the years but in certain areas we have 
noticed a decline in localized populations. By looking in different environmental variables 
it is possible to help identify how turkeys can be impacted by environmantl changes 
associated with climate change. 


# Problem / Question
Does climate and habitat change negativly impact wild turkey populations within New York State?

## Example 1
  
  https://link.springer.com/article/10.1007/s00442-021-05055-x

I used this article in the beginning of my research in order to understand
how much research has already been done pertaining to climate change and
wild turkey populations. This study focuses more on the extreme effects of 
climate change while my project looks more at how climate change has affected 
environmental factors that in turn effect wild turkey populations.   

## Example 2
https://onlinelibrary.wiley.com/doi/epdf/10.1111/j.0906-7590.2008.5203.x

Example 2 goes into detail about Maxent which is a recently introduced 
modeling technique, achieving high predictive
accuracy and enjoying several additional attractive properties. I don't know 
too much about this program but I know it will help me create my SDM with 
increased accuracy from older programs. The reading goes into detail about 
Maxtent and what it is capable of.

## Example 3
https://roanoke.com/sports/outdoors/virginia-s-turkey-management-plan-finally-set/article_2a8137b8-904e-11e3-91da-0017a43b2370.html?mode=image&photo=2

I liked the graphic that they used within this article. 
Here they used spring gobbler suitability and then 
mapped where the population trends are increasing or 
decreasing. This shows that once I produce my maps and SDMs they could be useful
to different people for different reasons like how to actively manage wild
turkey populations within certain areas. 


# Proposed data sources
Turkey data: 
  eBird data from 1991-2021 on all wild turkey sightings withn NYS
  NYSDEC citizen survey data from 1999-2020
  NYSDEC Spring harvest gobbler report 2011-2020
  Worldclim data (max temp and precip)
  Lancover/ land usage 
  Treecover/ Tree loss 
  maxent

# Proposed methods
The first step would be to create multiple maps/graphs/tables all at the same spatial scale
of 1 km if possible. The maps would include: 
  NY shapefile 
  NY county lines within the shapefile 
  max temperature for NY from Worldclim 
  max precipitaiton for NY from worldclim
  land cover change for NY from Dr. Williams data she provided
  Tree cover/ change for NY from Dr. Williams data she provided

  
The second step would be to create a SDM. 
  First filter out as much bias as we can from the ebird and citizen survey 
  once we filter the data to be as unbias as we can the next step would be to 
  create the SDM to see the suitablity score. 
  Maxent 
  
# Expected results
 I am hoping that the results will show that in areas where turkey populations have seen population
 declines there has also been increased precipitation, changing land use and tree cover.
 I would also expect to see a decrease in the species suitablitly score within these areas 
 

At the very end of this I would like to have one SDM comparing all my environmental factor
to the # of wild turkey observations and/ or a map of NYS by county showing suitability like the one
in my third example link. 
I should have at least 3 maps from my first step and at 
least one map of the number of obersavtions. The number of observations will also make a nice table. 