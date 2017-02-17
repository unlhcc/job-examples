# LARGE data example - using airline.csv

library(parallel)
library(dplyr)

airline <- read_csv("airline_trunc.csv")

birthmonth <- function(y){
  minYear <- min(y[,'Year'], na.rm=TRUE)
  these <- which(y[,'Year']==minYear)
  minMonth <- min(y[these, 'Month'], na.rm=TRUE)
  return(12 * minYear + minMonth - 1)
}



cl <- makeCluster(5)
stopCluster(cl)
