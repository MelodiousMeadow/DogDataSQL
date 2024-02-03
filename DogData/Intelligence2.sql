--What is the overall ranking of breeds across all classifications based on obedience percentage?
select breed, classification,obediencepercentage,
rank() over(partition by classification order by breed)
from dogintelligence 