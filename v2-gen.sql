-- Генерация издателей
INSERT INTO Publishers (name, location)
SELECT 
    'Publisher_' || i AS name,
    'City_' || (random() * 50 + 1)::INT AS location
FROM generate_series(1, 10) AS i;

-- Генерация авторов
INSERT INTO Authors (name, email)
SELECT 
    'Author_' || i AS name,
    'author_' || i || '@example.com' AS email
FROM generate_series(1, 50) AS i;

-- Генерация книг с проверкой наличия авторов и издателей
INSERT INTO Books (title, published_year, author_id, publisher_id)
SELECT 
    'Book_' || i AS title,
    (random() * 523 + 1500)::INT AS published_year, 
    (SELECT id FROM Authors ORDER BY random() LIMIT 1) AS author_id,
    (SELECT id FROM Publishers ORDER BY random() LIMIT 1) AS publisher_id
FROM generate_series(1, 200) AS i
WHERE EXISTS (SELECT 1 FROM Authors) AND EXISTS (SELECT 1 FROM Publishers);

-- Генерация жанров
INSERT INTO Genres (name)
SELECT DISTINCT 'Genre_' || i
FROM generate_series(1, 20) AS i;

-- Генерация связи книг и жанров каждая книга получает от 1 до 3 жанров
INSERT INTO Book_Genres (book_id, genre_id)
SELECT 
    (SELECT id FROM Books ORDER BY random() LIMIT 1) AS book_id,
    (SELECT id FROM Genres ORDER BY random() LIMIT 1) AS genre_id
FROM generate_series(1, 300) AS i
WHERE EXISTS (SELECT 1 FROM Books) AND EXISTS (SELECT 1 FROM Genres);

-- Проверяем итоговое количество записей
SELECT 
    (SELECT COUNT(*) FROM Publishers) AS total_publishers,
    (SELECT COUNT(*) FROM Authors) AS total_authors,
    (SELECT COUNT(*) FROM Books) AS total_books,
    (SELECT COUNT(*) FROM Genres) AS total_genres,
    (SELECT COUNT(*) FROM Book_Genres) AS total_book_genres;
