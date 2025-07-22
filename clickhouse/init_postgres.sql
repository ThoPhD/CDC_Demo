CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date TIMESTAMP NOT NULL,
    total_amount NUMERIC NOT NULL
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    event_type TEXT NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Add customers
INSERT INTO customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Carol', 'carol@example.com'),
('David', 'david@example.com');

-- Add events
INSERT INTO events (customer_id, event_type, updated_at) VALUES
-- Product views
(1, 'ProductView', current_timestamp - INTERVAL '2 days'),   -- Alice
(2, 'ProductView', current_timestamp - INTERVAL '3 days'),   -- Bob
-- Page views
(1, 'PageView', current_timestamp - INTERVAL '3 days'),      -- Alice
(3, 'PageView', current_timestamp - INTERVAL '2 days');      -- Carol

-- Add orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(2, current_timestamp - INTERVAL '1 day', 100),              -- Bob: after product view
(3, current_timestamp - INTERVAL '10 days', 120),            -- Carol: recent, > $100
(4, current_timestamp - INTERVAL '40 days', 300);            -- David: old order
