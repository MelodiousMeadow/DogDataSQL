--Create a query that categorizes breeds into 'Small,' 'Medium,' and 'Large' based on their average weight, considering both the low and high values.
--with AvgDogWeight as( 
--select Breed,
--	(weight_low_lbs + weight_high_lbs)/2 as AvgWeight
--from DogBreeds
--order by (weight_low_lbs + weight_high_lbs)/2 desc)

--SELECT
	--Breed,
	--case when AvgWeight between 3 and 50 then 'SmallDog'
	--when AvgWeight between 51 and 100 then 'MediumDog'
	--when AvgWeight between 100 and 200 then 'LargeDog' end as DogSize
--from AvgDogWeight

WITH AvgDogWeight AS (
  SELECT
    Breed,
    (weight_low_lbs + weight_high_lbs) / 2 AS AvgWeight,
    ROW_NUMBER() OVER (PARTITION BY
                       CASE
                         WHEN (weight_low_lbs + weight_high_lbs) / 2 BETWEEN 3 AND 50 THEN 'SmallDog'
                         WHEN (weight_low_lbs + weight_high_lbs) / 2 BETWEEN 51 AND 100 THEN 'MediumDog'
                         WHEN (weight_low_lbs + weight_high_lbs) / 2 BETWEEN 101 AND 200 THEN 'LargeDog'
                       END
                       ORDER BY (weight_low_lbs + weight_high_lbs) / 2 DESC) AS DogRank
  FROM
    DogBreeds
)
SELECT
  Breed,
  AvgWeight,
  CASE
    WHEN AvgWeight BETWEEN 3 AND 50 THEN 'SmallDog'
    WHEN AvgWeight BETWEEN 51 AND 100 THEN 'MediumDog'
    WHEN AvgWeight BETWEEN 101 AND 200 THEN 'LargeDog'
  END AS DogSize
FROM
  AvgDogWeight
WHERE
  DogRank <= 5
ORDER BY
  DogSize, DogRank;
