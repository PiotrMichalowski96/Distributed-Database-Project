#Ilość dzienników dla każdego wydawcy
USE ReadingService;

SELECT p.publisherName as Publisher, COUNT(*) as Number_of_newspapers
FROM Publisher p 
JOIN Newspaper n 
ON p.publisherId = n.publisherId
GROUP BY n.publisherId
ORDER BY Number_of_newspapers DESC;
