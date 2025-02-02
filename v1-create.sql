/**
 @author Gimaev Daniel 11-305 @DanielGim-Hub
*/
-- Издательства
CREATE TABLE Publishers (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    location    VARCHAR(100)
);

--  Авторы
CREATE TABLE Authors (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) UNIQUE
);

--  Книги
CREATE TABLE Books (
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(200) NOT NULL,
    published_year INT CHECK (published_year >= 1500),
    author_id   INT REFERENCES Authors(id) ON DELETE CASCADE,
    publisher_id INT REFERENCES Publishers(id) ON DELETE SET NULL
);

--  Жанры
CREATE TABLE Genres (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE
);

--  Связь между книгами и жанрами
CREATE TABLE Book_Genres (
    book_id     INT REFERENCES Books(id) ON DELETE CASCADE,
    genre_id    INT REFERENCES Genres(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, genre_id)
);
