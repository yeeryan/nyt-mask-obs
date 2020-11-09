nyc.plot <- function() {
  #Create Join of NYT, COVID19, and spatial data
  nyc.nyt <- full_join(nyt.data, nyc.covid19.data, by="zip") 
  nyc.nyt.geo <- geo_join(nyc, nyc.nyt, "ZCTA5CE10", "zip")

  #nyc.nyt <-  geo_join(nyc, nyc.nyt, "ZCTA5CE10", "zip")
  
  nyc.nyt.0713 <- nyc.nyt %>% filter(date == "2020-07-13")
  nyc.nyt.0713 <- geo_join(nyc, nyc.nyt.0713, "ZCTA5CE10", "zip")
  
  nyc.nyt.0720 <- nyc.nyt %>% filter(date == "2020-07-20")
  nyc.nyt.0720 <- geo_join(nyc, nyc.nyt.0720, "ZCTA5CE10", "zip")
  
  nyc.nyt.0727 <- nyc.nyt %>% filter(date == "2020-07-27")
  nyc.nyt.0727 <- geo_join(nyc, nyc.nyt.0727, "ZCTA5CE10", "zip")
  
  nyc.nyt.0803 <- nyc.nyt %>% filter(date == "2020-08-03")
  nyc.nyt.0803 <- geo_join(nyc, nyc.nyt.0803, "ZCTA5CE10", "zip")
  
  nyc.nyt.0810 <- nyc.nyt %>% filter(date == "2020-08-10")
  nyc.nyt.0810 <- geo_join(nyc, nyc.nyt.0810, "ZCTA5CE10", "zip")
  
  
  palC <- colorNumeric(
    palette = "Reds",
    domain = nyc.nyt.0810$COVID_CASE_RATE)
  
  palM <- colorNumeric(
    palette = "Blues",
    domain = nyc.nyt.geo$obs_mask)
  
  total.plot <- leaflet() %>% 
    addProviderTiles("CartoDB.Positron") %>% 
    addPolygons(data = nyc.nyt.geo,
                fillColor = ~palM(obs_mask),
                color = "#b2aeae",
                fillOpacity = 1,
                weight = 2,
                smoothFactor = 0.2,
                group = "NYT Obs",
                popup = paste0("<b>",nyc.nyt.geo$area,", ", nyc.nyt.geo$boro," ",nyc.nyt.geo$ZCTA5CE10,"</b>","<br>",
                               nyc.nyt.geo$location,"<br>",
                       "Observed Mask Usage: ", scales::percent(nyc.nyt.geo$obs_mask))) %>%
    
    addPolygons(data = nyc.nyt.0713,
                fillColor = ~palC(nyc.nyt.0713$COVID_CASE_RATE),
                color = "#b2aeae",
                fillOpacity = 0.7,
                weight = 1,
                smoothFactor = 0.2,
                group = "July 13",
                popup = paste0("<b>", nyc.nyt.0713$NEIGHBORHOOD_NAME,", ",nyc.nyt.0713$BOROUGH_GROUP," ",nyc.nyt.0713$ZCTA5CE10,"</b>", "<br>", 
                       "Case Rate: ", round(nyc.nyt.0713$COVID_CASE_RATE))) %>%
    addPolygons(data = nyc.nyt.0720,
                fillColor = ~palC(nyc.nyt.0720$COVID_CASE_RATE),
                color = "#b2aeae",
                fillOpacity = 0.7,
                weight = 1,
                smoothFactor = 0.2,
                group = "July 20",
                popup = paste0("<b>", nyc.nyt.0720$NEIGHBORHOOD_NAME,", ",nyc.nyt.0720$BOROUGH_GROUP," ",nyc.nyt.0720$ZCTA5CE10,"</b>", "<br>", 
                               "Case Rate: ", round(nyc.nyt.0720$COVID_CASE_RATE))) %>%
    addPolygons(data = nyc.nyt.0727,
                fillColor = ~palC(nyc.nyt.0727$COVID_CASE_RATE),
                color = "#b2aeae",
                fillOpacity = 0.7,
                weight = 1,
                smoothFactor = 0.2,
                group = "July 27",
                popup = paste0("<b>", nyc.nyt.0727$NEIGHBORHOOD_NAME,", ",nyc.nyt.0727$BOROUGH_GROUP," ",nyc.nyt.0727$ZCTA5CE10,"</b>", "<br>", 
                               "Case Rate: ", round(nyc.nyt.0727$COVID_CASE_RATE))) %>%
    addPolygons(data = nyc.nyt.0803,
                fillColor = ~palC(nyc.nyt.0803$COVID_CASE_RATE),
                color = "#b2aeae",
                fillOpacity = 0.7,
                weight = 1,
                smoothFactor = 0.2,
                group = "August 8",
                popup = paste0("<b>", nyc.nyt.0803$NEIGHBORHOOD_NAME,", ",nyc.nyt.0803$BOROUGH_GROUP," ",nyc.nyt.0803$ZCTA5CE10,"</b>", "<br>", 
                               "Case Rate: ", round(nyc.nyt.0803$COVID_CASE_RATE))) %>%
    addPolygons(data = nyc.nyt.0810,
                fillColor = ~palC(nyc.nyt.0810$COVID_CASE_RATE),
                color = "#b2aeae",
                fillOpacity = 0.7,
                weight = 1,
                smoothFactor = 0.2,
                group = "August 10",
                popup = paste0("<b>", nyc.nyt.0810$NEIGHBORHOOD_NAME,", ",nyc.nyt.0810$BOROUGH_GROUP," ",nyc.nyt.0810$ZCTA5CE10,"</b>", "<br>", 
                               "Case Rate: ", round(nyc.nyt.0810$COVID_CASE_RATE))) %>%
    addLegend(pal = palC,
              values = nyc.nyt.0810$COVID_CASE_RATE, 
              position = "bottomright", 
              title = paste0("COVID 19 Rate per 100k pop"),
              group = "July 13") %>% 
    addLegend(pal = palM,
              values = nyc.nyt.geo$obs_mask, 
              position = "topright", 
              title = "Observed Mask Usage",
              labFormat = labelFormat(suffix = "%"),
              group = "NYT Obs") %>% 
    
    addLayersControl(
      baseGroups = c("July 13","July 20","July 27","August 3","August 10","NYT Obs"),
      options = layersControlOptions(collapsed = FALSE),
      position = "topleft") %>% 
    hideGroup("NYT Obs")
  
  return(total.plot)
}

unified.plot <- nyc.plot()

