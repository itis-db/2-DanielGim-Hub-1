/**
  @author
 */
-- Используем CTE для выборки книг, опубликованных после 2000 года, и их авторов
WITH recent_books AS (
    SELECT * 
    FROM Books 
    WHERE published_year > 2000
)
SELECT rb.title, rb.published_year, a.name AS author_name
FROM recent_books rb
JOIN Authors a ON rb.author_id = a.id;

-- Объединяем результаты двух запросов с использованием UNION
SELECT author_id, publisher_id 
FROM Books 
WHERE author_id < 20
UNION
SELECT author_id, publisher_id 
FROM Books 
WHERE published_year > 2010;

-- Создаём CTE для объединения author_id и publisher_id
WITH combined_ids AS (
    SELECT author_id AS id FROM Books
    UNION
    SELECT publisher_id FROM Books
)
SELECT a.id, a.name, a.email 
FROM Authors a
JOIN combined_ids ci ON a.id = ci.id
UNION
SELECT p.id, p.name, p.location 
FROM Publishers p;
