#Jakie źródła najczęściej wykorzystują dani autorzy?
USE ReadingService;

SELECT CONCAT(Author.firstname,' ',Author.surname) AS Author, Source.sourceName, Source.sourceType, count(Source.sourceId) AS Quantity
FROM Author
INNER JOIN Article_has_Author
ON Author.authorId = Article_has_Author.authorId
INNER JOIN Article
ON Article.articleId = Article_has_Author.articleId
INNER JOIN Article_has_Source
ON Article.articleId = Article_has_Source.articleId
INNER JOIN Source
ON Article_has_Source.sourceId = Source.sourceId
GROUP BY Author.authorId, Source.sourceId
ORDER BY Quantity DESC
LIMIT 20;
