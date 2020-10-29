#NYTimes Observation Map-------
#Merging NYT observations and spatial data
nyc.nyt <- geo_join(nyc, nyt.data, "ZCTA5CE10", "zip") %>% 
  drop_na()

#Function for creating mask usage map
nyt_map <- function(data) {
  pal <- colorNumeric(
    palette = "Blues",
    domain = data$obs_mask)
  
  popup <- paste0("<b>",data$area,", ", data$boro," ",data$ZCTA5CE10,"</b>","<br>",
                  data$location,"<br>",
                  "Observed Mask Usage: ", scales::percent(data$obs_mask))
  leaflet() %>% 
    addProviderTiles("CartoDB.Positron") %>% 
    addPolygons(data = data,
                fillColor = ~pal(obs_mask),
                color = "#b2aeae",
                fillOpacity = 0.7, 
                weight = 1, 
                smoothFactor = 0.2,
                popup = popup) %>% 
    addLegend(pal = pal,
              values = data$obs_mask, 
              position = "bottomright", 
              title = "Observed Mask Usage",
              labFormat = labelFormat(suffix = "%"))
}

nyt.map <- nyt_map(nyc.nyt)

#NYC Health COVID 19 Maps------------
#Function for creating COVID19 map
covid19_map <- function(day) {
  nyc.covid19.dated <- nyc.covid19.data %>% 
    filter(date == day)
  
  nyc.dated <- geo_join(nyc, nyc.covid19.dated, "ZCTA5CE10", "zip")
  
  pal <- colorNumeric(
    palette = "Reds",
    domain = nyc.dated$COVID_CASE_RATE)
  
  popup <- paste0("<b>", "ZCTA: ", nyc.dated$ZCTA5CE10,"</b>", "<br>", 
                  "COVID 19 Case Rate: ", round(nyc.dated$COVID_CASE_RATE))

  nyc.dated.map <- leaflet() %>% 
    addProviderTiles("CartoDB.Positron") %>% 
    addPolygons(data = nyc.dated,
                fillColor = ~pal(COVID_CASE_RATE),
                color = "#b2aeae",
                fillOpacity = 0.7, 
                weight = 1, 
                smoothFactor = 0.2,
                popup = popup) %>% 
    addLegend(pal = pal,
              values = nyc.dated$COVID_CASE_RATE, 
              position = "bottomright", 
              title = paste0(day," | COVID 19 Rate per 100,000 People"))
  
  return(nyc.dated.map)
}

nyc.0713.map <- covid19_map("2020-07-13")
nyc.0720.map <- covid19_map("2020-07-20")
nyc.0727.map <- covid19_map("2020-07-27")
nyc.0803.map <- covid19_map("2020-08-03")
nyc.0810.map <- covid19_map("2020-08-10")

