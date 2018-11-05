CREATE TABLE tables (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64),
  description TEXT,
  location POINT,
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(10), 
  phone VARCHAR(15)
);