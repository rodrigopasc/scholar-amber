-- +micrate Up
CREATE TABLE categories (
  id BIGSERIAL PRIMARY KEY,
  description VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS categories;
