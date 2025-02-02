/**
  @author
 */
-- Создаем временные таблицы для  копирования данных
CREATE TABLE temp_authors AS SELECT * FROM authors;
CREATE TABLE temp_publishers AS SELECT * FROM publishers;
CREATE TABLE temp_books AS SELECT * FROM books;

-- Удаление ключей
ALTER TABLE books DROP CONSTRAINT IF EXISTS books_authorid_fkey;
ALTER TABLE books DROP CONSTRAINT IF EXISTS books_publisherid_fkey;

-- Удаление сур ключей
ALTER TABLE authors DROP CONSTRAINT IF EXISTS authors_pkey;
ALTER TABLE publishers DROP CONSTRAINT IF EXISTS publishers_pkey;
ALTER TABLE books DROP CONSTRAINT IF EXISTS books_pkey;

-- Добавляем новые первичные ключи на основе доменных атрибутов
ALTER TABLE authors ADD PRIMARY KEY (name, birth_date);
ALTER TABLE publishers ADD PRIMARY KEY (name, country);
ALTER TABLE books ADD PRIMARY KEY (title, author_name, author_birth_date, publisher_name, publisher_country);

-- Добавляем недостающие колонки для хранения естественных ключей
ALTER TABLE books ADD COLUMN author_name VARCHAR(100);
ALTER TABLE books ADD COLUMN author_birth_date DATE;
ALTER TABLE books ADD COLUMN publisher_name VARCHAR(100);
ALTER TABLE books ADD COLUMN publisher_country VARCHAR(50);

-- Обновляем таблицу книг, связывая книги с их авторами и издателями
UPDATE books b
SET 
    author_name = a.name,
    author_birth_date = a.birth_date,
    publisher_name = p.name,
    publisher_country = p.country
FROM temp_books tb
    JOIN authors a ON tb.authorid = a.id
    JOIN publishers p ON tb.publisherid = p.id
WHERE b.title = tb.title;

-- Удаляем старые суррогатные ключи (id)
ALTER TABLE authors DROP COLUMN id;
ALTER TABLE publishers DROP COLUMN id;
ALTER TABLE books DROP COLUMN authorid, DROP COLUMN publisherid;

-- Добавляем внешние ключи
ALTER TABLE books ADD FOREIGN KEY (author_name, author_birth_date) REFERENCES authors (name, birth_date);
ALTER TABLE books ADD FOREIGN KEY (publisher_name, publisher_country) REFERENCES publishers (name, country);

-- Удаляем временные таблицы
DROP TABLE temp_authors;
DROP TABLE temp_publishers;
DROP TABLE temp_books;

-- ROLLBACK (откат изменений)
ALTER TABLE books DROP CONSTRAINT IF EXISTS books_pkey CASCADE;
ALTER TABLE authors DROP CONSTRAINT IF EXISTS authors_pkey CASCADE;
ALTER TABLE publishers DROP CONSTRAINT IF EXISTS publishers_pkey CASCADE;

-- Возвращаем id обратно
ALTER TABLE authors ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE publishers ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE books ADD COLUMN authorid INTEGER;
ALTER TABLE books ADD COLUMN publisherid INTEGER;

-- Восстанавливаем данные
UPDATE books b
SET 
    authorid = a.id,
    publisherid = p.id
FROM authors a, publishers p
WHERE b.author_name = a.name AND b.author_birth_date = a.birth_date
AND b.publisher_name = p.name AND b.publisher_country = p.country;

-- Восстанавливаем внешние ключи
ALTER TABLE books ADD CONSTRAINT books_authorid_fkey FOREIGN KEY (authorid) REFERENCES authors (id);
ALTER TABLE books ADD CONSTRAINT books_publisherid_fkey FOREIGN KEY (publisherid) REFERENCES publishers (id);

ALTER TABLE books DROP COLUMN author_name;
ALTER TABLE books DROP COLUMN author_birth_date;
ALTER TABLE books DROP COLUMN publisher_name;
ALTER TABLE books DROP COLUMN publisher_country;
