--TABLE 1 - GLOBAL NUMBERS
SELECT	
	CAST(SUM(new_cases) AS INT) AS total_cases, SUM(cast(new_deaths AS FLOAT)) AS 
	total_deaths, SUM(cast(new_deaths AS INT))/SUM(CAST(New_Cases AS float))*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not null 
ORDER BY 1,2


--TABLE 2 - TOTAL DEATH BY CONTINENT
SELECT 
	location, SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NULL
AND location NOT IN ('World', 'European Union', 'International', 'European Union (27)'
	,'High-income countries','Upper-middle-income countries', 'Lower-middle-income countries', 'Low-income countries')
GROUP BY location
ORDER BY TotalDeathCount DESC


--TABLE 3 - POPULATION INFECTED BY COUNTRY
SELECT 
	Location, Population, MAX(total_cases) AS HighestInfectionCount,  
	MAX((CAST(total_cases AS FLOAT)/CAST(population AS FLOAT)))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC


--TABLE 4 - POPULATION INFECTED BY COUNTRY BY DATE
SELECT 
	Location, Population,date, MAX(total_cases) as HighestInfectionCount,  
	MAX((CAST(total_cases AS FLOAT)/CAST(population AS FLOAT)))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC