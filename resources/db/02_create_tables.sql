USE AGENTIC_AI;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(100) NOT NULL UNIQUE,
    email       VARCHAR(150) NOT NULL UNIQUE,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(150) NOT NULL,
    owner_id    INT NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_projects_users
        FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- Sample seed data
INSERT INTO users (username, email)
VALUES 
  ('admin', 'admin@example.com'),
  ('testuser', 'test@example.com')
ON DUPLICATE KEY UPDATE username = username;

-- Validate data
SELECT * FROM users;
