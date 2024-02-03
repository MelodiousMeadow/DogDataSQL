
--Find breeds that are both classified as 'Large' based on their average weight and have a high obedience percentage. List them in descending order of obedience.

with cte as (select di.breed as Breed, di.ObediencePercentage as ObediencePercentage,
	(db.weight_low_lbs+db.weight_high_lbs)/2 as AvgWeight
from DogIntelligence di 
join dogbreeds db on di.Breed = db.Breed)

select Breed,ObediencePercentage, AvgWeight,
case when AvgWeight <50 then 'Small' 
	when AvgWeight between 50 and 70 then 'Medium'
	when AvgWeight >70 then 'Large' end as 'SizeOfDog'
from cte
where SizeOfDog = 'Large' and ObediencePercentage>70
order by ObediencePercentage desc

