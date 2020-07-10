# **Understanding Weather + Socio/Health impacts on COVID19**

>This project was undertaken as academic study to understand and apply the concepts of ***BUAN 6320: DataBase Foundations for Business Analytics***. The data set chosen by the course instructor and the analysis done as part of this project is not representative of the overall statistics.

## About:

The 3,142 counties of the United States span a diverse range of social, economic, health, and weather conditions. Because of the COVID19 pandemic, over 2,400 of these counties have already experienced some COVID19 cases.

Combining county-level data on health, socioeconomics, and weather can help us address identify which populations are at risk for COVID19 and help prepare high-risk communities.

Temperature and humidity may affect the transmissibility of COVID19, but in the United States, warmer regions also tend to have markedly different socioeconomic and health demographics. As such, it's important to be able to control for factors like obesity, diabetes, access to healthcare, and poverty rates, since these factors themselves likely play a role in COVID19 transmission and fatality rates.

The dataset has 3 CSV files and total of 415 columns:
  1. US_counties_COVID19_health_weather_data.csv
  1. us_county_sociohealth_data.csv
  1. us_county_geometry.csv

The dataset provides all of this information, formatted, cleaned, and ready for analysis. Most columns have little or no missing data. A small number have larger amounts of missing data; see the kernel that generated this dataset for more details:(https://www.kaggle.com/johnjdavisiv/us-counties-weather-health-covid19-data)

Thanks to [John Davis](https://www.kaggle.com/johnjdavisiv) for the dataset!

## Note:

>The project is in progress and is subject to change technically. All the documentation will be updated as the project progress.

## DataBase Creation:

Refer the [**Project_ER_Schema.mwb**](https://github.com/rajadevineni/COVID_Analysis/blob/master/Project_ER_Schema.mwb) file for ER Schema of the designed DataBase, [**Project_ER_Schema.sql**](https://github.com/rajadevineni/COVID_Analysis/blob/master/Project_ER_Schema.sql) file can be used to create the DB on the local system.

## INSERT_SQL queries Generation:

[**sql_insert_generator.ipynb**](https://github.com/rajadevineni/COVID_Analysis/blob/master/sql_insert_generator.ipynb) python notebook takes input of 3 CSV files and generates INSERT SQL quries for each tables designed in DB Schema.
  the python notebook does many of the data processing functions like duplicate handling and splitting the columns and generating datasets for individual tables.

## Data Loading:

Due to the foreign key dependencies between the tables, run the SQL files in the below order only. you can find the [SQL queries here](https://github.com/rajadevineni/COVID_Analysis/blob/master/Data_Load_Quries/SQL_Scripts.zip) 
  1. state_lockdown_details.sql
  1. county_details.sql
  1. station_details.sql
  1. fips_daily_cases.sql
  1. daily_weather_details.sql
  1. county_socio_health.sql

## Validation:

* After Creating the DB and loading the data, "Validation_Quries.sql" can be used to check if you have loaded the complete data as expected. 
* Each query has the count commented below to check you data count after loading into the table.  
