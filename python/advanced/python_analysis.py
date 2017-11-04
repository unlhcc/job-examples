
# coding: utf-8

# In[ ]:

# Import libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestClassifier


# In[ ]:

# Load airline.csv data
flights = pd.read_csv("./data/airline_trunc.csv",
                     sep = ",")
flights.head(5)


# In[ ]:

# The structure of the dataframe
flights.dtypes


# In[ ]:

# Number of rows and columns in dataframe
flights.shape


# In[ ]:

# Remove flights with missing data
flights = flights.dropna(axis = [0, 1], how = "any")
flights.shape


# In[ ]:

# Function to estimate birthmonth of aircraft by finding the month and year of first flight
def birthmonth(airplane):
    minYear = airplane['Year'].min()
    minMonth = airplane[airplane['Year'] == minYear]['Month'].min()
    return (12*minYear + minMonth - 1);

# Create vectors for each aircraft (aircrafts)
aircrafts = flights['TailNum'].unique()
aircrafts = [s for s in aircrafts if str(s) != 'nan']

aircrafts[1:10]


# In[ ]:

# Calculate Age of each airline at time of flight
flights['Start'] = np.nan

for x in aircrafts:
    birthday = (birthmonth(flights[flights['TailNum'] == x]))
    flights['Start'].loc[flights['TailNum'] == x,] = birthday

flights = flights.assign(Age = flights.Year * 12 + flights.Month - flights.Start)
    
flights[1:10]


# In[ ]:

# Remove flights with Age of 1
flights_subset = flights[(flights['Age']!=1.0)]

flights_subset.shape


# In[ ]:

# Generate linear model for response: ArrDelay and predictors: Age
x = flights_subset.Age.values
y = flights_subset.ArrDelay.values

x = x.reshape(len(x), 1)
y = y.reshape(len(y), 1)

lm = LinearRegression()
lm.fit(x, y)

# Create scatter plot
plt.scatter(x, y,  color='black')
plt.plot(x, lm.predict(x), color='blue', linewidth=3)
plt.show()

# View the Rsquared value for the regression equation
lm.score(x, y)


# In[ ]:

# Create violin plot showing delay by month
flights_subset = []

for x in np.unique(flights[["Month"]].values):
    flights_subset.append(flights[flights["Month"] == x]["ArrDelay"].values)

fig, axes = plt.subplots()
axes.violinplot(flights_subset, positions=np.unique(flights[["Month"]].values))
plt.show()


# In[ ]:

# Determine range of ArrDelay
print("Minimum delay:", flights["ArrDelay"].min(),"Maximum delay:", flights["ArrDelay"].max())


# In[ ]:

# Bin ArrDelay
bins = [-50,-15,30,120,500]
bin_names = ["Early","On-Time", "Late", "Very Late"]
flights["ArrCategory"] = pd.cut(flights["ArrDelay"], bins, labels = bin_names)

flights[1:10]


# In[ ]:

### Create Random Forest for response: ArrDelay and predictors: Month, Year and Age

# Create training and testing subsets
X = flights[['Month', 'Year', 'Age']]
y = flights["ArrDelay"]

forest = RandomForestClassifier(max_depth = 3)
forest.fit(X, y)

# Importance of each feature: 'Month', 'Year', and 'Age'
forest.feature_importances_


# In[ ]:
