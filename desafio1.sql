DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists (
	id_artist INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255)
);

INSERT INTO `SpotifyClone`.`artists`
(`first_name`, `last_name`)
VALUES ('Walter', 'Phoenix'),
	   ('Peter', 'Strong'),
	   ('Lance', 'Day'),
	   ('Freedie', 'Shannon'),
       ('Tyler', 'Isle'),
       ('Fog', NULL);

CREATE TABLE plans (
	id_plan INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(255) NOT NULL,
    plan_value DOUBLE NOT NULL
);

INSERT INTO `SpotifyClone`.`plans`
(`plan_name`, `plan_value`)
VALUES ('Gratuito', 0),
	   ('Familiar', 7.99),
	   ('Universitário', 5.99),
	   ('Pessoal', 6.99);

CREATE TABLE albums (
	id_album INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(255) NOT NULL,
	id_artist INT,
    release_date YEAR NOT NULL,
    FOREIGN KEY(id_artist) REFERENCES artists(id_artist)
);

INSERT INTO `SpotifyClone`.`albums`
(`album_name`, `id_artist`, `release_date`)
VALUES ('Envious', 1, 1990),
	   ('Exuberant', 1, 1993),
       ('Hallowed Steam', 2, 1995),
       ('Incandescent', 3, 1998),
       ('Temporary Culture', 4, 2001),
       ('Library of liberty', 4, 2003),
       ('Chained Down', 5, 2007),
       ('Cabinet of fools', 5, 2012),
       ('No guarantees', 5, 2015),
       ('Apparatus', 6, 2015);

CREATE TABLE musics (
	id_music INT PRIMARY KEY AUTO_INCREMENT,
    music_name VARCHAR(255) NOT NULL,
    seconds_duration INT NOT NULL,
    id_album INT,
    FOREIGN KEY(id_album) REFERENCES albums(id_album)
);

INSERT INTO `SpotifyClone`.`musics`
(`music_name`, `seconds_duration`,`id_album`)
VALUES ('Soul For Us', 200, 1),
	   ('Reflections Of Magic', 163, 1),
       ('Dance With Her Own', 116, 1),
       ('Troubles Of My Inner Fire', 203, 2),
       ('Time Fireworks', 152, 2),
       ('Magic Circus', 105, 3),
       ('Honey, So Do I', 207, 3),
       ("Sweetie, Let's Go Wild", 139, 3),
       ('She Knows', 244, 3),
       ('Fantasy For Me', 100, 4),
       ('Celebration Of More', 146, 4),
       ('Rock His Everything', 223, 4),
       ('Home Forever', 231, 4),
       ('Diamond Power', 241, 4),
       ("Let's Be Silly", 132, 4),
       ('Thang Of Thunder', 240, 5),
       ('Words Of Her Life', 185, 5),
       ('Without My Streets', 176, 5),
       ('Need Of The Evening', 190, 6),
       ('History Of My Roses', 222, 6),
       ('Without My Love', 111, 6),
       ('Walking And Game', 123, 6),
       ('Young And Father', 197, 6),
       ('Finding My Traditions', 179, 7),
       ('Walking And Man', 229, 7),
       ('Hard And Time', 135, 7),
       ("Honey, I'm A Lone Wolf", 150, 7),
       ("She Thinks I Won't Stay Tonight", 166, 8),
       ("He Heard You're Bad For Me", 154, 8),
       ("He Hopes We Can't Stay", 210, 8),
       ('I Know I Know', 117, 8),
       ("He's Walking Away", 159, 9),
       ("He's Trouble", 138, 9),
       ('I Heard I Want To Bo Alone', 120, 9),
       ('I Ride Alone', 151, 9),
       ('Honey', 79, 10),
       ('You Cheated On Me', 95, 10),
       ("Wouldn't It Be Nice", 213, 10),
       ('Baby', 136, 10),
       ('You Make Me Feel So..', 83, 10);

CREATE TABLE users (
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    age INT NOT NULL,
	id_plan INT,
    date_signature DATE NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES plans(id_plan)
);

INSERT INTO `SpotifyClone`.`users`
(`first_name`, `last_name`, `age`, `id_plan`, `date_signature`)
VALUES	('Thati', NULL, 23, 1, '2019-10-20'),
	    ('Cintia', NULL, 35, 2, '2017-12-30'),
        ('Bill', NULL, 20, 3, '2019-06-05'),
        ('Roger', NULL, 45, 4, '2020-05-13'),
        ('Norman', NULL, 58, 4, '2017-02-17'),
        ('Patrick', NULL, 33, 2, '2017-01-06'),
        ('Vivian', NULL, 26, 3, '2018-01-05'),
        ('Carol', NULL, 19, 3, '2018-02-14'),
        ('Angelina', NULL, 42, 2, '2018-04-29'),
        ('Paul', NULL, 46, 2, '2017-01-17');

CREATE TABLE followers (
	id_following INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
	id_artist INT,
    CONSTRAINT PRIMARY KEY(id_user, id_artist),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_artist) REFERENCES artists(id_artist)
);

INSERT INTO `SpotifyClone`.`followers`
(`id_user`, `id_artist`)
VALUES (1, 1), (1, 4), (1, 3),
	   (2, 1), (2, 3),
       (3, 2), (3, 1),
       (4, 4),
       (5, 5), (5, 6),
       (6, 6), (6, 3), (6, 1),
       (7, 2), (7, 5),
       (8, 1), (8, 5),
       (9, 6), (9, 4), (9, 3),
       (10, 2), (10, 6);

CREATE TABLE reproduction_history (
	id_reproduction INT PRIMARY KEY AUTO_INCREMENT,
	id_user INT,
    id_music INT,
    reproduction_date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(id_user, id_music),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_music) REFERENCES musics(id_music)
);

INSERT INTO `SpotifyClone`.`reproduction_history`
(`id_user`, `id_music`, `reproduction_date`)
VALUES	(1, 36, '2020-02-28 10:45:55'),
	    (1, 25, '2020-05-02 05:30:35'),
        (1, 23, '020-03-06 11:22:33'),
        (1, 14, '2020-08-05 08:05:17'),
        (1, 15, '2020-09-14 16:32:22'),
        (2, 34, '2020-01-02 07:40:33'),
        (2, 24, '2020-05-16 06:16:22'),
        (2, 21, '2020-10-09 12:27:48'),
        (2, 39, '2020-09-21 13:14:46'),
        (3, 6, '2020-11-13 16:55:13'),
        (3, 3, '2020-12-05 18:38:30'),
        (3, 26, '2020-07-30 10:00:00'),
        (4, 2, '2021-08-15 17:10:10'),
        (4, 35, '2021-07-10 15:20:30'),
        (4, 27, '2021-01-09 01:44:33'),
        (5, 7, '2020-07-03 19:33:28'),
        (5, 12, '2017-02-24 21:14:22'),
        (5, 14, '2020-08-06 15:23:43'),
        (5, 1, '2020-11-10 13:52:27'),
        (6, 38, '2019-02-07 20:33:48'),
        (6, 29, '2017-01-24 00:31:17'),
        (6, 30, '2017-10-12 12:35:20'),
        (6, 22, '2018-05-29 14:56:41'),
        (7, 5, '2018-05-09 22:30:49'),
        (7, 4, '2020-07-27 12:52:58'),
        (7, 11, '2018-01-16 18:40:43'),
        (8, 39, '2018-03-21 16:56:40'),
        (8, 40, '2020-10-18 13:38:05'),
        (8, 32, '2019-05-25 08:14:03'),
        (8, 33, '2021-08-15 21:37:09'),
        (9, 16, '2021-05-24 17:23:45'),
        (9, 17, '2018-12-07 22:48:52'),
        (9, 8, '2021-03-14 06:14:26'),
        (9, 9, '2020-04-01 03:36:00'),
        (10, 20, '2017-02-06 08:21:34'),
        (10, 21, '2017-12-04 05:33:43'),
        (10, 12, '2017-07-27 05:24:49'),
        (10, 13, '2017-12-25 01:03:57');
