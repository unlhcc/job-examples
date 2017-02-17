# LARGE data example using airplane.csv and biganalytics

library(bigmemory)
library(biganalytics)
library(bigtabulate)

airline <- read.big.matrix("airline_trunc.csv", 
                           header=TRUE,
                           type=character,
                           extraCols = "Age")

birthmonth <- function(y){
  minYear <- min(y[,'Year'], na.rm=TRUE)
  these <- which(y[,'Year']==minYear)
  minMonth <- min(y[these, 'Month'], na.rm=TRUE)
  return(12 * minYear + minMonth - 1)
}

