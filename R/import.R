#New York Times Observations---------
#Importing NYT Observations
nyt.data <- read_csv(file = "data/nyt_obs.csv")

#NYC Health COVID 19 Data-------------

#Function to load NYC Health COVID19 data, adding date column
load_nyc.health <- function(csv, day) {
  read_csv(file = csv) %>% 
    add_column(date = as.Date(day), .after = 1) }

#Importing NYC Health COVID19 data to single tibble, renaming MODIFIED_ZCTA column for JOIN
nyc.covid19.data <- load_nyc.health("data/0713 data-by-modzcta.csv", "2020-07-13") %>% 
  add_row(load_nyc.health("data/0720 data-by-modzcta.csv", "2020-07-20")) %>% 
  add_row(load_nyc.health("data/0727 data-by-modzcta.csv", "2020-07-27")) %>% 
  add_row(load_nyc.health("data/0803 data-by-modzcta.csv", "2020-08-03")) %>% 
  add_row(load_nyc.health("data/0810 data-by-modzcta.csv", "2020-08-10")) %>% 
  rename(zip = MODIFIED_ZCTA)

#ZCTA Spacial Data from the US Census--------
#Defining NYC region ZCTAs
load_nyc.zcta <- function(){
  nyc.zcta <- c("100","101","102","103","104",
                "111","112","113","114","116")
  
  zctas(cb = TRUE, starts_with = nyc.zcta, class = "sf")
}
nyc <- load_nyc.zcta()

#Retrieving ZCTA sf from Census
nyc$ZCTA5CE10 <- as.double(as.character(nyc$ZCTA5CE10))

