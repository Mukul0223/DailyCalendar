-- creates table to store refresh tokens
CREATE TABLE refresh_tokens (
    user_id INT NOT NULL,
    token_hash TEXT NOT NULL UNIQUE,
    jti TEXT PRIMARY KEY,
    expire_at TIMESTAMPTZ NOT NULL,
    revoked_at TIMESTAMPTZ,
    replaced_by TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_token_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_token_user ON refresh_tokens (user_id);

ALTER TABLE refresh_tokens ENABLE ROW LEVEL SECURITY;
