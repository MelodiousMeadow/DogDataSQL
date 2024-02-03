--Identify breeds that are classified as 'Medium' based on their average weight and have a significant difference between their low and high weights. Provide their average intelligence classification.

with cte as (select di.breed as Breed, di.ObediencePercentage as ObediencePercentage,
	(db.weight_low_lbs+db.weight_high_lbs)/2 as AvgWeight,
	db.weight_high_lbs - db.weight_low_lbs as WeightDifference
from DogIntelligence di 
join dogbreeds db on di.Breed = db.Breed)

select Breed,ObediencePercentage, AvgWeight,
case when AvgWeight <50 then 'Small' 
	when AvgWeight between 50 and 70 then 'Medium'
	when AvgWeight >70 then 'Large' end as 'SizeOfDog'
from cte
where SizeOfDog = 'Medium' and WeightDifference > 20
order by ObediencePercentage desc





