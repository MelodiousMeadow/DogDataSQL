--DogIntelligence Table:
--Determine the obedience classification with the highest average percentage and retrieve the corresponding breeds.
select Classification,
avg(obediencepercentage),
group_concat(Breed)
from DogIntelligence di 
group by Classification 
