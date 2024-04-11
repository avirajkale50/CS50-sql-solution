-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--Query to insert the data in the database

INSERT INTO `project`.`movie` (`id`, `title`, `desc`, `cover`, `price`) VALUES
  (1, 'Haikyuu', 'The story follows Hinata Shoyo, a passionate volleyball player, who joins the Karasuno High School Volleyball Club.', 'haikyuu.jpg', 150),
  (2, 'Tokyo Ghoul', 'The story tells the dark fantasy tale of an ordinary college student, Ken Kaneki, who transforms into a half-ghoul after a mistaken organ transplant.', 'tokyo_ghoul.jpg', 180),
  (3, 'Tokyo Revengers', 'Delinquent Takemichi Hanagaki learns his middle school girlfriend Hinata Tachibana has been killed by the Tokyo Manji Gang.', 'tokyo_revengers.jpg', 190),
  (4, 'Hotarubi no Mori e', 'The story of a summer spent by a young girl and a spirit boy in the Light Forest.', 'hotarubi_no_mori_e.jpg', 120),
  (5, 'Drifting Home', 'Three middle schoolers visit their childhood apartment building during summer break and get mysteriously transported to a different world.', 'drifting_home.jpg', 160),
  (6, 'Your Name', 'A coming-of-age story about a teenage boy and girl who mysteriously swap bodies.', 'your_name.jpg', 200),
  (7, 'Another', 'At Yomiyama North High School, Class 3-3, a strange rumor persists: "If the odd one out is ignored, everyone else will be safe."', 'another.jpg', 140),
  (8, 'One Piece', 'One Piece is a long-running manga about a pirate named Monkey D. Luffy and his crew on their adventures to find the legendary treasure One Piece and become the Pirate King.', 'one_piece.jpg', 250),
  (9, 'My Hero Academia', 'My Hero Academia follows Izuku Midoriya, a boy born without a Quirk (superpower) in a world where they are the norm, as he dreams of becoming a Hero himself.', 'my_hero_academia.jpg', 170),
  (10, 'Spirited Away', 'Chihiro Ogino, a sullen ten-year-old girl, enters the world of spirits when her family moves to a new neighborhood.', 'spirited_away.jpg', 220);



INSERT INTO `project`.`writer` (`id`, `first_name`, `last_name`, `birthdate`) VALUES
(1, 'Haruichi', 'Furudate', '1983-03-07'),
(2, 'Sui', 'Ishida', '1986-12-28'),
(3, 'Ken', 'Wakui', NULL),
(4, 'Yuki', 'Midorikawa', NULL),
(5, 'Makoto', 'Shinkai', '1973-02-09'),
(6, 'Eiichiro', 'Oda', '1975-01-01'),
(7, 'Kōhei', 'Horikoshi', '1986-11-20'),
(8, 'Hayao', 'Miyazaki', '1941-01-05'),
(9, 'Yukito', 'Ayatsuji', NULL);




INSERT INTO `project`.`movie_rel_writer` (`movie_id`, `writer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, NULL),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9);

INSERT INTO `project`.`genre` (`name`) VALUES
('Sports'),
('Drama'),
('Comedy'),
('Horror'),
('Supernatural'),
('Psychological'),
('Action'),
('Romance'),
('Fantasy'),
('Adventure'),
('Superhero'),
('Mystery'),
('Thriller');

INSERT INTO `project`.`movie_rel_genre` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 2),
(3, 5),
(4, 8),
(4, 5),
(4, 2),
(5, 9),
(5, 8),
(5, 2),
(6, 8),
(6, 2),
(6, 7),
(7, 9),
(7, 7),
(7, 3),
(7, 2),
(7, 8),
(8, 7),
(8, 3),
(8, 10),
(8, 2),
(9, 8),
(9, 9),
(9, 2),
(10, 4),
(10, 11),
(10, 12);




INSERT INTO `project`.`production_house` (`id`, `name`, `since`, `desc`) VALUES
(1, 'Production I.G', '1995-12-15', 'Japanese animation studio known for producing high-quality anime series and films.'),
(2, 'Studio Pierrot', '1979-10-15', 'Japanese animation studio best known for producing long-running series such as Naruto.'),
(3, 'Liden Films', '2012-03-01', 'Japanese animation studio involved in the production of various anime series and films.'),
(4, 'Brain\'s Base', '1996-01-01', 'Japanese animation studio that has produced several popular anime series and films.'),
(5, 'Madhouse', '1972-10-10', 'Renowned Japanese animation studio known for its diverse range of anime productions.'),
(6, 'CoMix Wave Films', '2007-12-15', 'Japanese animation film studio known for its visually stunning and emotionally resonant films.'),
(7, 'Toei Animation', '1948-08-26', 'One of the oldest and most prominent animation studios in Japan, known for classic anime series and films.'),
(8, 'Bones', '1998-10-28', 'Japanese animation studio known for producing critically acclaimed anime series and films.'),
(9, 'Studio Ghibli', '1985-06-15', 'Internationally acclaimed Japanese animation film studio founded by Hayao Miyazaki.'),
(10, 'P.A. Works', '2000-11-10', 'Japanese animation studio known for its beautiful animation and engaging storytelling in various anime series and films.');




INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(5,5);
INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(6,6);
INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(7,7);
INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(8,8);
INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(9,9);
INSERT INTO `project`.`movie_rel_prod` (`movie_id`, `Production_house_id`) VALUES
(10,10);


-- Query to retrive the data

SELECT * FROM `movie`;

SELECT * FROM `production_house`
WHERE `id` = (
	SELECT `Production_house_id` FROM `movie_rel_prod`
    WHERE `movie_id`= (
		SELECT `id` FROM `movie`
		WHERE `title`='Another'
    )
);

SELECT `production_house`.`name` AS `production_house`, COUNT(*) AS `movie_count`
FROM `production_house`
JOIN `movie_rel_prod` ON `production_house`.`id` = `movie_rel_prod`.`Production_house_id`
GROUP BY `production_house`.`name`;

SELECT `movie`.`title`
FROM `movie`
JOIN `movie_rel_genre` ON `movie`.`id` = `movie_rel_genre`.`movie_id`
JOIN `genre` ON `movie_rel_genre`.`genre_id` = `genre`.`id`
WHERE `genre`.`name` = 'Horror';

SELECT `movie`.`title`
FROM `movie`
JOIN `movie_rel_writer` ON `movie`.`id` = `movie_rel_writer`.`movie_id`
JOIN `writer` ON `movie_rel_writer`.`writer_id` = `writer`.`id`
WHERE `writer`.`first_name` = 'Hayao' AND `writer`.`last_name` = 'Miyazaki';
