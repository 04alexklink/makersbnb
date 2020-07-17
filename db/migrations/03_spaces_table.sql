-- REGULAR

CREATE TABLE spaces(id SERIAL PRIMARY KEY, space_name VARCHAR(100) NOT NULL, space_address VARCHAR(100) NOT NULL);
ALTER TABLE spaces ADD space_price VARCHAR(25);
ALTER TABLE spaces ADD space_description VARCHAR(500);
ALTER TABLE spaces ADD user_id INTEGER;

-- TEST

CREATE TABLE spaces(id SERIAL PRIMARY KEY, space_name VARCHAR(100) NOT NULL, space_address VARCHAR(100) NOT NULL);
ALTER TABLE spaces ADD space_price VARCHAR(25);
ALTER TABLE spaces ADD space_description VARCHAR(500);
ALTER TABLE spaces ADD user_id INTEGER;
