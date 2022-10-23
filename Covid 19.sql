select * from Portfolio..['Covid deaths$']
order by 3,4;

--select * from Portfolio..['Covid VAccinations$']
--order by 3,4;

select location,date,total_cases,new_cases,total_deaths
from Portfolio..['Covid deaths$']
order by 1,2;

select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from Portfolio..['Covid deaths$']
where location like 'india'
order by 1,2


Select date, sum(new_cases) as total,sum(cast(new_deaths as int)),sum(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercentage
from Portfolio..['Covid deaths$']
where continent is not null
--group by date
order by 1,2


Select dea.continent,dea.location, dea.date,vac.new_vaccinations
,sum(convert(int,vac.new_vaccinations )) over (partition by dea.location)
from Portfolio..['Covid deaths$'] dea 
join Portfolio..['Covid VAccinations$'] vac
	on dea.location=vac.location
	and dea.date=vac.date
where continent is not null
order by 2,3


Create Table #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)+







