--Identify the breeds that have the largest difference between their low and high weight, indicating high growth potential.
--The St Bernard followed by the Irish Wolfhound and the Black Russian Terrior have the highest growth potentials 

select breed, weight_high_lbs - weight_low_lbs as WeightDifference
from DogBreeds db 
order by WeightDifference desc