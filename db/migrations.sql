DROP DATABASE IF EXISTS easy_health_tracker;
CREATE DATABASE easy_health_tracker;

\c easy_health_tracker

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(32),
  password_digest VARCHAR(60)
);

CREATE TABLE day_calories(
  id SERIAL PRIMARY KEY,
  calories INTEGER,
  user_id INTEGER REFERENCES users(id)
 );