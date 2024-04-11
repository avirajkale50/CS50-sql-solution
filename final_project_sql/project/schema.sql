-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
--Query for Creating the database/schema
CREATE SCHEMA `project`;
USE `project`;

--Creating a table movie
CREATE TABLE `project`.`movie`(
`id` INT AUTO_INCREMENT,
`title` VARCHAR(45) NOT NULL,
`desc` VARCHAR(255) NOT NULL,
`cover` VARCHAR(45),
PRIMARY KEY(id)
);
-- Modifying the table
ALTER TABLE movie ADD COLUMN price INT NOT NULL;

--Creating a table production_house to save inforamtion about the production house
CREATE TABLE `project`.`production_house` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `since` DATE,
    `desc` VARCHAR(255),
    PRIMARY KEY (`id`)
);

--Creating a relationship table to connect the movie and the production house
CREATE TABLE `project`.`movie_rel_prod` (
    `movie_id` INT,
    `Production_house_id` INT,
    FOREIGN KEY (`movie_id`) REFERENCES `movie`(`id`),
    FOREIGN KEY (`Production_house_id`) REFERENCES `production_house`(`id`)
);

--Creating a table writer to save inforamtion about the writer of series and movie
CREATE TABLE `project`.`writer` (
    `id` INT AUTO_INCREMENT,
    `birthdate` DATE,
    `first_name` VARCHAR(60) NOT NULL,
    `last_name` VARCHAR(60) NOT NULL,
    PRIMARY KEY (`id`)
);

--Creating a relationship table to connect the movie and the writer
CREATE TABLE `project`.`movie_rel_writer` (
    `movie_id` INT,
    `writer_id` INT,
    FOREIGN KEY (`movie_id`) REFERENCES `movie`(`id`),
    FOREIGN KEY (`writer_id`) REFERENCES `writer`(`id`)
);
-- creating the table to store the genre
CREATE TABLE `project`.`genre`(
`id` INT AUTO_INCREMENT,
`name` VARCHAR(60) NOT NULL,
PRIMARY KEY(id)
);
-- Table for maintaining the relation in movie and genre
CREATE TABLE `project`.`movie_rel_genre` (
    `movie_id` INT,
    `genre_id` INT,
    FOREIGN KEY (`movie_id`) REFERENCES `movie`(`id`),
    FOREIGN KEY (`genre_id`) REFERENCES `genre`(`id`)
);
-- Table to maintain log that what opration get perform on the database
CREATE TABLE `project`.`movie_audit` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `movie_id` INT NOT NULL,
    `action` ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    `old_title` VARCHAR(45),
    `old_desc` VARCHAR(255),
    `old_cover` VARCHAR(45),
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Creating trigger to maintain the log
DELIMITER //
CREATE TRIGGER after_movie_insert
AFTER INSERT ON `project`.`movie`
FOR EACH ROW
BEGIN
    INSERT INTO `project`.`movie_audit` (`movie_id`, `action`, `old_title`, `old_desc`, `old_cover`)
    VALUES (NEW.id, 'INSERT', NULL, NULL, NULL);
END//

CREATE TRIGGER after_movie_update
AFTER UPDATE ON `project`.`movie`
FOR EACH ROW
BEGIN
    INSERT INTO `project`.`movie_audit` (`movie_id`, `action`, `old_title`, `old_desc`, `old_cover`)
    VALUES (NEW.id, 'UPDATE', OLD.title, OLD.desc, OLD.cover);
END//

CREATE TRIGGER after_movie_delete
AFTER DELETE ON `project`.`movie`
FOR EACH ROW
BEGIN
    INSERT INTO `project`.`movie_audit` (`movie_id`, `action`, `old_title`, `old_desc`, `old_cover`)
    VALUES (OLD.id, 'DELETE', OLD.title, OLD.desc, OLD.cover);
END//
DELIMITER ;

-- Creating the index to speed up the search
CREATE INDEX `movie_id_search`
ON  `movie`(`id`);
CREATE INDEX `production_id_search`
ON  `production_house`(`id`);
CREATE INDEX `genre_id_search`
ON  `genre`(`id`);

