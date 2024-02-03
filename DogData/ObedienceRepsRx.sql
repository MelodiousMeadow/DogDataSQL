--Investigate if there is a relationship between the obedience percentage and the average number of repetitions. Provide a list of breeds where this relationship is evident.
--as avg reps increases, the obedience percentage tends to decrease
with cte as (select (reps_lower+reps_upper)/2 as AvgReps,
	Breed,ObediencePercentage
from DogIntelligence di) 



select Breed, AvgReps, ObediencePercentage
from cte 

