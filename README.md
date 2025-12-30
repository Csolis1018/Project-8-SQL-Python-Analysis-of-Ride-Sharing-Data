# 🛺 Zuber Ride-Sharing Data Analysis
# 🚀 Project Overview
You are working as a data analyst for Zuber, a new ride-sharing company launching in Chicago. The goal is to identify patterns in ride data, understand passenger preferences, and analyze the impact of external factors, such as weather, on trips.

The project is divided into two main parts:

SQL Analysis: Extract and prepare data to identify trends and passenger behavior.
Python Analysis: Use the SQL data to explore key trends, detect outliers, and validate a hypothesis about the relationship between trip duration and weather conditions.
# 📊 Dataset Description
The dataset includes the following tables:

neighborhoods:

name: Name of the neighborhood.
neighborhood_id: Neighborhood code.
cabs:

cab_id: Vehicle code.
vehicle_id: Technical vehicle ID.
company_name: Taxi company name.
trips:

trip_id: Trip code.
cab_id: Vehicle code operating the trip.
start_ts: Trip start date and time (rounded to the hour).
end_ts: Trip end date and time (rounded to the hour).
duration_seconds: Trip duration in seconds.
distance_miles: Trip distance in miles.
pickup_location_id: Neighborhood code for pickup.
dropoff_location_id: Neighborhood code for dropoff.
weather_records:

record_id: Weather record code.
ts: Date and time of the weather record (rounded to the hour).
temperature: Temperature at the time of the record.
description: Brief weather description (e.g., "light rain," "scattered clouds").
# 🎯 Key Objectives
Identify neighborhoods and companies with the highest number of completed trips. Verify and remove outliers to ensure precise analysis. Test a statistical hypothesis to determine if there is a relationship between trip duration and weather conditions.

# 📊 Analysis Results
# 🏆 Leading Taxi Companies
Chicago has 64 taxi companies, but Flash Cab dominates the market, completing 19,558 rides—the highest among all competitors.
# 📍 Most Popular Destination
The Loop in Chicago is the top drop-off location, likely due to its status as a major tourist and business hub in the city.
🌦️ Impact of Weather on Rides
Chicago's weather is known for rapid changes and strong winds.
Statistical tests (t-test and Levene's test) were conducted to analyze the impact of weather on ride duration.
Results indicate that weather does not significantly affect taxi trips in Chicago.
# 🛠️ Tools and Technologies
Programming Languages: Python, SQL Data Extraction: BeautifulSoup Data Preparation: SQL Data Analysis: Pandas, NumPy, SciPy Data Visualization: Matplotlib, Seaborn

# 📈 Core Competencies
Data Cleaning and Preparation. Data Visualization and Reporting. Hypothesis Testing using statistical methods.
Explica:

cómo planteaste las hipótesis nula y alternativa
qué criterio usaste para probar las hipótesis y por qué
