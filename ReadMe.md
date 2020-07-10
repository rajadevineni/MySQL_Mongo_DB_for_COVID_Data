Introduction:

The 3,142 counties of the United States span a diverse range of social, economic, health, and weather conditions. Because of the COVID19 pandemic, over 2,400 of these counties have already experienced some COVID19 cases.

Combining county-level data on health, socioeconomics, and weather can help us address identify which populations are at risk for COVID19 and help prepare high-risk communities.

Temperature and humidity may affect the transmissibility of COVID19, but in the United States, warmer regions also tend to have markedly different socioeconomic and health demographics. As such, it's important to be able to control for factors like obesity, diabetes, access to healthcare, and poverty rates, since these factors themselves likely play a role in COVID19 transmission and fatality rates.

Data Base Creation:

Refer the "Project_ER_Schema.mwb" file for ER Schema of the designed DataBase. 
"Project_ER_Schema.sql" file can be used to create the DB.

INSERT_SQL queries Generation:

"sql_insert_generator.ipynb" python notebook takes input of 3 CSV files and generates INSERT SQL quries for each tables designed in DB Schema.
  the python notebook does many of the data processing functions like duplicate handling and splitting the columns and generating datasets for individual tables.

Data Loading:

Due to dependencies, run the SQL files in the below order only:
1. state_lockdown_details.sql
2. county_details.sql
3. station_details.sql
4. fips_daily_cases.sql
5. daily_weather_details.sql
6. county_socio_health.sql

Validation:

After Creating the DB and loading the data, "Validation_Quries.sql" can be used to check if you have loaded the complete data as expected. 
