# LARGE data example - using airline.csv

if(!require(dplyr)) install.packages("dplyr")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(maps)) install.packages("maps")

# Load airline.csv data
flights <- read.table("./data/airline.csv", sep=",", header=TRUE, stringsAsFactors=FALSE)

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
test <- flights[,'Year'] * as.integer(12) + 
                flights[,'Month'] - as.integer(acStart[flights[,'TailNum']])

flights <- mutate(flights, Age = (Year*as.integer(12))+ Month - as.integer(acStart[TailNum]))

# Generate linear model for response: ArrDelay and predictors: Age and Year 
lm <- lm(ArrDelay ~ Age + Year, data=flights)
summary(lm)

# Convert Months from number to factor
flights$Month <- factor(flights$Month)
levels(flights$Month) <- month.abb

# Select a subset of fields needed to graph arrival delays by month
subset_month <- select(flights, Month, ArrDelay)
# Remove any records missing Arrival delay data
subset_month <- subset[!is.na(subset$ArrDelay),]

# Create violin graph showing arrival delays by month
ggplot(subset_month, aes(Month,ArrDelay, fill=factor(Month))) + 
  geom_violin(aes(group=Month)) + 
  labs(y = "Arrival Delay (in minutes)") + 
  theme(legend.position="none") +
  labs(title = "Average Flight Arrival Delay by Month")

ggsave("ave_delay_by_month.jpg", width=9, height=6)
  
# Load state list for airport codes and join departure state to flights dataframe
airport_codes <- read.csv("airport_codes.csv", col.names=c("OriginState", "Origin"), stringsAsFactors = FALSE)
flights <- left_join(flights, airport_codes, by="Origin")

# Create subset of data containing origin state and arrival delay
subset_state <- select(flights, OriginState, ArrDelay)
subset_state <- subset_state[!is.na(subset_state$ArrDelay),]
subset_state <- group_by(subset_state, OriginState)
subset_summary <- summarise(subset_state, AveDelay=mean(ArrDelay))

# Create graphic of US States colored by average delay time
map = map_data("state")
ggplot(subset_summary, aes(fill=AveDelay)) +
  geom_map(aes(map_id=OriginState), map=map) +
  scale_fill_distiller(name = "Average Delay (mins)", palette = "Spectral", direction=-1) +
  expand_limits(x=map$long, y=map$lat) +
  theme_void() +
  labs(title = "Average Flight Arrival Delay by State")

ggsave("ave_delay_by_state.jpg", width=9, height=5)



