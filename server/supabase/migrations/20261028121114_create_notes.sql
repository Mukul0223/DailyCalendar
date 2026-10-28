-- creates table to holds notes

CREATE TABLE notes (
    note_id SERIAL PRIMARY KEY,
    note VARCHAR(500) NOT NULL,
    user_id INT NOT NULL,
    entry_date DATE NOT NULL,
    CONSTRAINT fk_note_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_notes_user_date ON notes (user_id, entry_date);

ALTER TABLE notes ENABLE ROW LEVEL SECURITY;
