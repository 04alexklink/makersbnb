CREATE DATABASE mobbnb;
\c mobbnb;
CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(254) NOT NULL, password VARCHAR(254) NOT NULL);