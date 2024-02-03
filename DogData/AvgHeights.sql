--Write a query to find the breeds with the highest average height, considering both the low and high values.
select Breed,
(weight_low_lbs + weight_high_lbs)/2 as AvgWeight
from DogBreeds
order by (weight_low_lbs + weight_high_lbs)/2 desc

