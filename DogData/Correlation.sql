--Investigate whether there is a correlation between the obedience percentage and the number of repetitions. Provide breeds where this correlation is significant.
SELECT
  (COUNT(*) * SUM(obediencepercentage * reps_upper) - SUM(obediencepercentage) * SUM(reps_upper)) /
  (SQRT((COUNT(*) * SUM(obediencepercentage * obediencepercentage) - SUM(obediencepercentage) * SUM(obediencepercentage)) *
  (COUNT(*) * SUM(reps_upper * reps_upper) - SUM(reps_upper) * SUM(reps_upper)))) AS correlation_upper,
  
  (COUNT(*) * SUM(obediencepercentage * reps_lower) - SUM(obediencepercentage) * SUM(reps_lower)) /
  (SQRT((COUNT(*) * SUM(obediencepercentage * obediencepercentage) - SUM(obediencepercentage) * SUM(obediencepercentage)) *
  (COUNT(*) * SUM(reps_lower * reps_lower) - SUM(reps_lower) * SUM(reps_lower)))) AS correlation_lower
FROM
  DogIntelligence di;



--Investigate if there is a correlation between the weight of a breed and its intelligence classification. Provide a list of breeds where this correlation is most noticeable.

