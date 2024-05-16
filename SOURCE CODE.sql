-- Q1. Write a code to check NULL values
SELECT 
    *
FROM
    covid
WHERE
    province IS NULL
        OR Latitude IS NULL
        OR Longitude IS NULL
        OR Date IS NULL
        OR Confirmed IS NULL
        OR Deaths IS NULL
        OR Recovered IS NULL
        OR 'Country/Region' IS NULL;

-- Q2. If NULL values are present, update them with zeros for all columns. 
UPDATE covid 
SET 
    Province = ISNULL(Province, ''),
    Country_Region = ISNULL(Country_Region, ''),
    Latitude = ISNULL(Latitude, 0),
    Longitude = ISNULL(Longitude, 0),
    Confirmed = ISNULL(Confirmed, 0),
    Deaths = ISNULL(Deaths, 0),
    Recovered = ISNULL(Recovered, 0);

-- Q3. check total number of rows
    
SELECT 
    COUNT(*) AS Total_rows
FROM
    covid;


-- Q4. Check what is start_date and end_date

SELECT 
	MIN(date) AS Start_Date, MAX(Date) AS End_Date
FROM covid;


-- Q5. Number of month present in dataset

SELECT 
    YEAR(date) AS date,
    COUNT(DISTINCT (MONTH(year))) asTotal_months
FROM
    covid
GROUP BY YEAR(date);


-- Q6. Find monthly average for confirmed, deaths, recovered

SELECT 
    SUBSTR(date, 7) AS year,
    SUBSTR(date, 4, 2) AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM
    covid;

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 

SELECT 
    SUBSTR(date, 7) AS year,
    SUBSTR(date, 4, 2) AS month,
    MAX(confirmed) AS mostfreq_confirm,
    MAX(deaths) AS mostfreq_deaths,
    MAX(recovered) AS mostfreq_recovered
FROM
    covid
GROUP BY year , month;

-- Q8. Find minimum values for confirmed, deaths, recovered per year

SELECT 
    SUBSTR(date, 7) AS year,
    MIN(confirmed) AS min_confirm,
    MIN(deaths) AS min_deaths,
    MIN(recovered) AS min_recovered
FROM
    covid
GROUP BY year;

-- Q9. Find maximum values of confirmed, deaths, recovered per year

SELECT 
    SUBSTR(date, 7) AS year,
    MAX(confirmed) AS min_confirm,
    MAX(deaths) AS min_deaths,
    MAX(recovered) AS min_recovered
FROM
    covid
GROUP BY year;

-- Q10. The total number of case of confirmed, deaths, recovered each month

SELECT 
    SUBSTR(date, 4, 2) AS month,
    COUNT(deaths) AS total_deaths,
    COUNT(confirmed) AS total_confirm,
    COUNT(recovered) AS total_recovered
FROM
    covid
GROUP BY month;

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT 
    SUBSTR(Date, 7) AS Year,
    SUBSTR(Date, 4, 2) AS Month,
    SUM(Confirmed) AS Sum_confirmed,
    AVG(Confirmed) AS avg_confirmed,
    VARIANCE(Confirmed) AS var_confirmed,
    STDDEV_SAMP(Confirmed) AS stddev_confirmed
FROM
    covid
GROUP BY Year , Month;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT 
    SUBSTR(Date, 7) AS Year,
    SUBSTR(Date, 4, 2) AS Month,
    SUM(Deaths) AS Sum_Deaths,
    AVG(Deaths) AS avg_Deaths,
    VARIANCE(Deaths) AS var_Deaths,
    STDDEV_SAMP(Deaths) AS stddev_Deaths
FROM
    covid
GROUP BY Year , Month;

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT 
    SUBSTR(Date, 7) AS Year,
    SUBSTR(Date, 4, 2) AS Month,
    AVG(Recovered) AS avg_Recovered,
    VARIANCE(Recovered) AS var_Recovered,
    STDDEV_SAMP(Recovered) AS stddev_Recovered,
    SUM(Recovered) AS Sum_Recovered
FROM
    covid
GROUP BY Year , Month;

-- Q14. Find Country having highest number of the Confirmed case

SELECT 
    'Country/Region', MAX(Confirmed) AS MaxConfirmed
FROM
    covid
GROUP BY 'Country/Region'
ORDER BY MaxConfirmed DESC
LIMIT 1;

-- Q15. Find Country having lowest number of the death case

SELECT 
    Country / Region, MIN(Deaths) AS lowdeaths
FROM
    covid
GROUP BY 'Country/Region'
ORDER BY lowdeaths DESC;

-- Q16. Find top 5 countries having highest recovered case

SELECT

Country/Region, MAX(Recovered) AS MaxRecovered

FROM

covid

GROUP BY Country/Region

ORDER BY MaxRecovered DESC

LIMIT 5;
