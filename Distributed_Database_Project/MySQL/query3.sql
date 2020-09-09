#jakie kategorie mają najczęściej artykuły w danych gazetach

USE ReadingService;

SELECT Newspaper.newspaperName, Category.categoryName, count(Article.newspaperId) as Quantity
FROM Article_has_Category
INNER JOIN Category
ON Article_has_Category.categoryId = Category.categoryId
INNER JOIN Article
ON Article_has_Category.articleId = Article.articleId
INNER JOIN Newspaper
ON Article.newspaperId = Newspaper.newspaperId
GROUP BY Newspaper.newspaperName, Category.categoryName, Article.newspaperId
ORDER BY Quantity DESC
LIMIT 20;
