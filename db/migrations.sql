DROP DATABASE IF EXISTS easy_health_tracker;
CREATE DATABASE easy_health_tracker;

\c easy_health_tracker

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(32),
  email VARCHAR(255),
  password_digest VARCHAR(60)
);