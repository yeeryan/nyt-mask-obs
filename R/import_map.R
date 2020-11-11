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

