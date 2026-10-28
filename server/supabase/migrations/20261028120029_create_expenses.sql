-- creates table to hold expenses
CREATE TABLE expenses (
    expense_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    quantity DECIMAL(10, 2) NOT NULL DEFAULT 1.00 CHECK (quantity > 0),
    total DECIMAL(10, 2) GENERATED ALWAYS AS (price * quantity) STORED,
    user_id INT NOT NULL,
    entry_date DATE NOT NULL,
    CONSTRAINT fk_expense_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    category_id INT NOT NULL,
    CONSTRAINT fk_category_expense FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

CREATE INDEX idx_expenses_user_date ON expenses (user_id, entry_date);
CREATE INDEX idx_expense_category ON expenses (category_id);

ALTER TABLE expenses ENABLE ROW LEVEL SECURITY;
