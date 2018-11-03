CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  table_id INTEGER REFERENCES tables(id),
  description TEXT
);