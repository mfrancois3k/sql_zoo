-- SECTION 0 - SELECT BASICS


-- 1. Modify it to show the population of Germany

SELECT population
FROM world
WHERE name = 'Germany';


-- 2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population
FROM world
WHERE name IN ('Ireland', 'Iceland', 'Dermark');



-- 3.  Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000;


-- SECTION 1 - SELECT NAME


-- 1. Find the country that starts with 'Y':
SELECT name 
FROM world
WHERE name LIKE 'Y%';

-- 2. Find the countries that end with 'y':
SELECT name
FROM world
WHERE name LIKE '%y';

-- 3. Luxemborg has an 'x' - so does another country, list them both:
SELECT name
FROM world
WHERE name LIKE '%x%';

-- 4. Find the countries that end with `land`:
SELECT name
FROM world
WHERE name LIKE '%land';

-- 5. Find the countries that start with 'C' and end in 'ia':
SELECT name
FROM world
WHERE name LIKE 'C%ia';

-- 6. Find the country which has a double 'oo' in it:
SELECT name
FROM world
WHERE name LIKE '%oo%';

-- 7. Find the countries that have three or more 'a' in the name:
SELECT name
FROM world
WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have 't' as a second character:
SELECT name FROM world
WHERE name LIKE '_t%';

-- 9. Find the countries that have two 'o' characters separated by two others:
SELECT name
FROM world
WHERE name LIKE '%o__o%';

-- 1.0 Find countries that have exactly four characters:
SELECT name
FROM world
WHERE name LIKE '____';


-- SECTION 2 - SELECT from World


-- 1. Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population
FROM world;

-- 2. Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world 
WHERE population > 200000000;

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population 
FROM world 
WHERE population > 200000000;

-- 4 Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions
SELECT NAME, population/1000000 
FROM world 
WHERE continent = 'South America';

-- 5. Show  the name and population for France, Germany, Italy
SELECT name, population 
FROM world 
WHERE name IN ('France', 'Germany', 'Italy');

-- 6.  Show the countries which have a name that includes the word 'United'
SELECT name 
FROM world 
WHERE name 
LIKE '%United%';


-- 7. Show the countries that are big by area or big by population but not both. Show name, population and area.
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;

-- 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area from WORLD
WHERE (area <= 3000000 AND  population > 250000000) 
OR (area > 3000000 AND population <= 250000000);


-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
SELECT name, ROUND(population/1000000, 2) AS population, ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';


-- 10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(gdp/population, 2)
FROM world
WHERE gdp > 10000000000;

-- Section 3: From Nobel


-- 11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);


-- 12. Show the name and the capital where the first letters of each match.


-- Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE name != capital
AND LENGTH(name) = LENGTH(capital);

-- 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name
LIKE '%a%'
AND name LIKE '%e%' 
AND name LIKE '%i%' 
AND name LIKE '%o%' 
AND name LIKE '%u%';


--SECTION 3 - SELECT FROM nobel


-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT * FROM nobel
WHERE year = 1950;


-- 2. Show who won the 1962 prize for Literature.
SELECT * FROM nobel
WHERE year = 1962 
AND category = 'Literature';


-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT * FROM nobel 
WHERE name = 'Albert Einstein';


-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT * FROM nobel
WHERE year >= 2000
AND category = 'Peace';


-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT * FROM nobel
WHERE year >= 1980
AND year <= 1989
AND category = 'Literature';


/* 6. Show all details of the presidential winners:


Theodore Roosevelt


Woodrow Wilson


Jimmy Carter


Barack Obama*/

SELECT * FROM nobel
WHERE category = 'Peace'
AND name IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');


-- 7. Show the winners with first name John
SELECT * FROM nobel
WHERE name LIKE 'John%';

-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT * FROM nobel
WHERE year IN (1980, 1984)
AND category IN ('Physics', 'Chemistry');


-- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT * FROM nobel
WHERE year = 1980
AND category NOT IN ('Chemistry', 'Medicine');



-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year


-- (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year


-- (after 2004, including 2004)

SELECT * FROM nobel
WHERE year < 1910
OR (year > 2004 AND category = 'Literature');




