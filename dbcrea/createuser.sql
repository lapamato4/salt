CREATE DATABASE hats;
USE hats;
GRANT ALL ON hats.* TO hats@localhost IDENTIFIED BY 'Salasana123';
CREATE TABLE superhats(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(1024), color VARCHAR(1024));
INSERT INTO superhats(name, color) VALUES('silinteri', 'musta');
INSERT INTO superhats(name, color) VALUES('fedora', 'punainen');


