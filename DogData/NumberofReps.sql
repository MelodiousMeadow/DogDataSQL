--Find the breeds with the lowest average number of repetitions for intelligence exercises, considering both lower and higher values.
--dogs with less reps needed are typically smarter 
select Breed,
(reps_upper+reps_lower)/2 as AvgReps
from DogIntelligence di 
group by Breed
order by AvgReps asc
‘