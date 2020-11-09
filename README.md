# nyt-mask-obs

### Current Status: 🟡 In Development 🟡

### Interactive Map is ACTIVE: 

https://yeeryan.github.io/nyt-mask-obs/


https://yeeryan.github.io/nyt-mask-obs/

## Overview
Data visualizaiton and analysis of the New York Times article "Are New Yorkers Wearing Masks? Here’s What We Found in Each Borough" and COVID 19 counts per 100,000 people from NYC Health around the time the mask observations were made.

According to the NY Times article, the observations took place across 14 locations in New York City from July 27th to July 30th between 9AM to 7PM. Because of this and knowledge about COVID 19's approximate incubation period of 2 weeks, I decided to use NYC Health's COVID 19 data from July 13th to August 10th as an outcome measures. I decided to use the COVID 19 rate per 100,000 people within a ZCTA as it accounted for population, however, it should be noted that other factors could influence the impact of spread.

### Data Visualisation (Functional)

The New York Times article offers street intersections, neighbourhoods, and boros for geographic info. NYC Health provides modified ZCTAs and neighbourhood names for geographic info. In order to map out the NYT observations, I manually looked up each street intersections' ZCTA and added it to the NYT_obs data set. This map uses geographic data from the US Census to draw each ZCTA.

The layer control on the upper left switches between COVID 10 Rate per 100k from NYC Health on different weeks and mask observations. When looking at NYC Health data designated by a date, clicking on a ZCTA will provide the following:
- neighbourhood information (as written by NYC Health)
- boro and  ZCTA
- case rate  

When looking at the mask observations, clicking on a ZCTA will show the following:
- neighbourhood information (as written by the NYT)
- street intersection of observation
- observed mask usage

### Report (In-progress)

More information coming soon.


### Sources

NY Times article:
https://www.nytimes.com/2020/08/20/nyregion/nyc-face-masks.html

COVID 19 Data:
https://www1.nyc.gov/site/doh/covid/covid-19-data.page
