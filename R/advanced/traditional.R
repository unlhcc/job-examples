# LARGE data example - using airline.csv

# Load airline.csv data
flights <- read.table("airline_trunc.csv", sep=",", header=TRUE, stringsAsFactors=FALSE)

# Function to estimate birthmonth of aircraft by finding the month and year of first flight
birthmonth <- function(y){
  minYear <- min(y[,'Year'], na.rm=TRUE)
  these <- which(y[,'Year']==minYear)
  minMonth <- min(y[these, 'Month'], na.rm=TRUE)
  return(12 * minYear + minMonth - 1)
}

# Remove flights with no tail number recorded
flights <- flights[!is.na(flights$TailNum),]

# Create arrays for each aircraft (aircrafts) and store their birthmonth (acStart)
aircrafts <- unique(flights[,'TailNum'])
aircrafts <- aircrafts[!is.na(aircrafts)]
acStart <- rep(0, length(aircrafts))
names(acStart) <- aircrafts

for (i in aircrafts) {
  acStart[i] <- birthmonth(flights[flights$TailNum==i,])
}

# Calculate flight age using the birthmonth
flights$Age <- flights[,'Year'] * as.integer(12) + 
                flights[,'Month'] - as.integer(acStart[flights[,'TailNum']])

# Generate linear model for response: ArrDelay and predictors: Age and Year 
lm <- lm(ArrDelay ~ Age + Year, data=flights)
summary(lm)


# Generate boxplots for each month of arrivals - In process may need to use tdyr and dplyr
boxplot(flights$ArrTime[flights$Month==1], names=month.name[1], at=1, width=rep(1,12))
for(i in 2:12) {
  boxplot(flights$ArrTime[flights$Month==i], names=month.name[i], add=TRUE, at=i)
}

summary <- vector(0)
for(i in unique(flights$Month)) {
  summary <- c(summary, summary(flights$ArrTime[flights$Month==i]))
}
