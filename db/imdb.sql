DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;

CREATE TABLE actors (
  id SERIAL4 PRIMARY KEY,
  f_name VARCHAR(255),
  l_name VARCHAR(255)
);

CREATE TABLE movies(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE roles (
  id SERIAL4 PRIMARY KEY,
  id_actor INT4 REFERENCES actors(id) ON DELETE CASCADE,
  id_movie INT4 REFERENCES movies(id) ON DELETE CASCADE,
  fee INT
);
