/**
  @author
 */
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    order_date TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_name TEXT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price NUMERIC(10, 2) NOT NULL CHECK (price > 0)
);

-- Генерация пользователей
INSERT INTO users (username, email, created_at)
SELECT 
    'user_' || i AS username,
    'user_' || i || '@example.com' AS email,
    NOW() - (random() * interval '1 year')
FROM generate_series(1, 100) AS i;

-- Генерация заказов с проверкой наличия пользователей
INSERT INTO orders (user_id, order_date)
SELECT 
    (SELECT id FROM users ORDER BY random() LIMIT 1) AS user_id,
    NOW() - (random() * interval '6 months')
FROM generate_series(1, 200) AS i
WHERE EXISTS (SELECT 1 FROM users); -- Проверяем есть ли пользователи

-- Генерация элементов заказа с проверкой наличия заказов
INSERT INTO order_items (order_id, product_name, quantity, price)
SELECT 
    (SELECT id FROM orders ORDER BY random() LIMIT 1) AS order_id,
    'Product_' || (random() * 50 + 1)::INT AS product_name, 
    (random() * 10 + 1)::INT AS quantity,
    (random() * 100 + 1)::NUMERIC(10, 2) AS price
FROM generate_series(1, 500) AS i
WHERE EXISTS (SELECT 1 FROM orders); -- Проверяем есть ли заказы

-- Проверяем итоговое количество записей
SELECT 
    (SELECT COUNT(*) FROM users) AS total_users,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM order_items) AS total_order_items;
