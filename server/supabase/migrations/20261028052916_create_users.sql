-- Creates users table
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  CONSTRAINT email_is_lowercase CHECK (email = LOWER(email))
);

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
