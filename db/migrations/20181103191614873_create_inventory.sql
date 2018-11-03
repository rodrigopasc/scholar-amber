-- +micrate Up
CREATE TABLE inventories (
  id BIGSERIAL PRIMARY KEY,
  description VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS inventories;
