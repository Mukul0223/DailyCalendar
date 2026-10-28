-- creates categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(15) NOT NULL CHECK (category_name = UPPER(category_name)),
    is_system BOOLEAN NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    UNIQUE (user_id, category_name),
    CHECK (is_system = (user_id IS NULL))
);

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
