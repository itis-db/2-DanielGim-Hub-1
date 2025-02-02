-- Изменение типов столбцов
ALTER TABLE Books
    ALTER COLUMN published_year TYPE NUMERIC(6, 0) USING published_year::NUMERIC(6, 0);

ALTER TABLE Authors
    ALTER COLUMN email TYPE TEXT;

-- Добавление новых столбцов
ALTER TABLE Books
    ADD COLUMN page_count INT CHECK (page_count > 0);

ALTER TABLE Authors
    ADD COLUMN birthdate DATE;

ALTER TABLE Publishers
    ADD COLUMN established_year INT CHECK (established_year >= 1800);

-- Добавление ограничений
ALTER TABLE Authors
    ADD CONSTRAINT unique_author_email UNIQUE (email);

ALTER TABLE Books
    ADD CONSTRAINT check_page_count CHECK (page_count > 0);

-- ROLLBACK ИЗМЕНЕНИЙ
-- Удаление добавленных столбцов
ALTER TABLE Books
    DROP COLUMN page_count;

ALTER TABLE Authors
    DROP COLUMN birthdate;

ALTER TABLE Publishers
    DROP COLUMN established_year;

-- Удаление добавленных ограничений
ALTER TABLE Authors
    DROP CONSTRAINT unique_author_email;

ALTER TABLE Books
    DROP CONSTRAINT check_page_count;

-- Возврат типов столбцов к исходным
ALTER TABLE Books
    ALTER COLUMN published_year TYPE INT USING published_year::INT;

ALTER TABLE Authors
    ALTER COLUMN email TYPE VARCHAR(100);
