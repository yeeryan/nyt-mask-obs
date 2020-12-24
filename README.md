# nyt-mask-obs

➡️ <a href = "https://yeeryan.github.io/nyt-mask-obs/">View the Report Draft</a> ⬅️

## Overview
This report aims to compare the observed mask usage rates in select areas in NYC to the COVID 19 data taken around the same time. The data is shown with visuals such as maps and charts for comparison across areas in NYC. Each area in this analysis is divided by ZCTA which is used by NYC Health and can be inferred from the NY Times article. The dates chosen are due to the estimated 2 week time period for COVID 19-related symptoms show. Each data set is analysed and visualized, and the methodology and potential limitations are explored in the report. 

Linear regression analysis is conducted later to determine if observed mask rates and population are signficiant predictors of case rates.


### Data Visualizations

The New York Times article offers street intersections, neighbourhoods, and boros for geographic info. NYC Health provides modified ZCTAs and neighbourhood names for geographic info. In order to map out the NYT observations, I manually looked up each street intersections' ZCTA and added it to the NYT_obs data set. This map uses geographic data from the US Census to draw each ZCTA.

The layer control on the upper left switches between COVID 10 Rate per 100k from NYC Health on different weeks and mask observations. When looking at NYC Health data designated by a date, clicking on a ZCTA will provide the following:
- neighbourhood information (as written by NYC Health)
- boro and  ZCTA
- case rate  

When looking at the mask observations, clicking on a ZCTA will show the following:
- neighbourhood information (as written by the NYT)
- street intersection of observation
- observed mask usage

Additional data visualizations are included as interactive plots throughout the report.

### Packages Used
- tidyverse
- ggfortify
- dplyr
- plotly (interactive plots)
- leafet (interactive map)
- tigiris (spatial data from US Census)

#### Usage

A. Access the report <a href = "https://yeeryan.github.io/nyt-mask-obs/">HERE</a>

OR

B. Use R to recreate the interactive dashboard with the following instructions:

1. Install the packages used in R with the following command:

`install.packages(c("tidyverse","dplyr","tigiris","plotly","leaflet"))`

2. Clone the repository

3. Open Report.Rmd in the project's `report` folder in RStudio

4. Knit Report.Rmd to generate a dashboard

#### Data Sources

<a href = "https://www.nytimes.com/2020/08/20/nyregion/nyc-face-masks.html">The New York Times - Are New Yorkers Wearing Masks?</a>

<a href = "https://www1.nyc.gov/site/doh/covid/covid-19-data.page">NYC Health - COVID-19 Data</a>
