-- REGULAR

CREATE TABLE spaces(id SERIAL PRIMARY KEY, space_name VARCHAR(100) NOT NULL, space_address VARCHAR(100) NOT NULL);
ALTER TABLE spaces ADD space_price INTEGER;
ALTER TABLE spaces ADD space_description VARCHAR(500);

-- TEST

CREATE TABLE spaces(id SERIAL PRIMARY KEY, space_name VARCHAR(100) NOT NULL, space_address VARCHAR(100) NOT NULL);
ALTER TABLE spaces ADD space_price INTEGER;
ALTER TABLE spaces ADD space_description VARCHAR(500);
