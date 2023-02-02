-- Queries to populate the database

CREATE TABLE people (
  id INT NOT NULL AUTO_INCREMENT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO people (first_name,last_name) VALUES ("John","Smith");
INSERT INTO people (first_name,last_name) VALUES ("Mary","Jones");
INSERT INTO people (first_name,last_name) VALUES ("Gerhard","Feuerhaufen");
INSERT INTO people (first_name,last_name) VALUES ("Rami","Pitkäniemi");
INSERT INTO people (first_name,last_name) VALUES ("Anna","Kråkström");

CREATE TABLE phones (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	numbers TEXT NOT NULL,
	PRIMARY KEY (id),
  	FOREIGN KEY (user_id) REFERENCES people(id)
  	
);

INSERT INTO phones (user_id, numbers) VALUES (2,"+1 213 621 0002");
INSERT INTO phones (user_id, numbers) VALUES (2,"+1 800 444 4444");
INSERT INTO phones (user_id, numbers) VALUES (1,"+1 604 444 4444");
INSERT INTO phones (user_id, numbers) VALUES (1,"+44 20 8759 9036");
INSERT INTO phones (user_id, numbers) VALUES (4,"+358 50 333 3333");
INSERT INTO phones (user_id, numbers) VALUES (5,"+46 771 793 336");

--

-- Exercise 2B
-- Answer:

SELECT COALESCE(CONCAT(first_name, ' ', last_name), "N/A") AS name, COALESCE(GROUP_CONCAT(numbers SEPARATOR ', '), "N/A") AS numbers
FROM people
LEFT JOIN phones ON people.id = phones.user_id
GROUP BY people.id
ORDER BY last_name, first_name;

--
