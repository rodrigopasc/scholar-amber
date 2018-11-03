-- +micrate Up
CREATE TABLE posts (
  id BIGSERIAL PRIMARY KEY,
  category_id BIGINT,
  title VARCHAR,
  content TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_category_id_idx ON posts (category_id);

-- +micrate Down
DROP TABLE IF EXISTS posts;
