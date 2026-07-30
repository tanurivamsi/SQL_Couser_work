-- ============================================================
-- CREATE DATABASE
-- ============================================================

DROP DATABASE IF EXISTS movie_prediction_db;

CREATE DATABASE movie_prediction_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE movie_prediction_db;


-- ============================================================
-- USERS TABLE
-- ============================================================

CREATE TABLE users (

    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(50) NOT NULL UNIQUE,

    email VARCHAR(255) NOT NULL UNIQUE,

    password VARCHAR(255) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB;



-- ============================================================
-- MOVIES TABLE
-- ============================================================

CREATE TABLE movies (

    movie_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(200) NOT NULL,

    genre VARCHAR(100) NOT NULL,

    release_year YEAR NOT NULL,

    runtime SMALLINT UNSIGNED NOT NULL,

    language VARCHAR(50) NOT NULL,

    director VARCHAR(150) NOT NULL,

    `cast` JSON NOT NULL,

    budget DECIMAL(15,2) NOT NULL,

    revenue DECIMAL(15,2) NOT NULL,

    rating DECIMAL(3,1) NOT NULL,

    votes INT UNSIGNED DEFAULT 0,

    popularity DECIMAL(8,2) DEFAULT 0.00,


    CHECK(runtime > 0),

    CHECK(budget >= 0),

    CHECK(revenue >= 0),

    CHECK(rating BETWEEN 0 AND 10),

    CHECK(popularity >= 0)


) ENGINE=InnoDB;



-- ============================================================
-- PREDICTIONS TABLE
-- ============================================================

CREATE TABLE predictions (

    prediction_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNSIGNED NOT NULL,

    movie_name VARCHAR(200) NOT NULL,

    genre VARCHAR(100) NOT NULL,

    budget DECIMAL(15,2) NOT NULL,

    predicted_rating DECIMAL(3,1) NOT NULL,

    predicted_revenue DECIMAL(15,2) NOT NULL,

    prediction_date DATE NOT NULL,


    FOREIGN KEY(user_id)

    REFERENCES users(user_id)

    ON UPDATE CASCADE

    ON DELETE CASCADE,


    CHECK(budget >= 0),

    CHECK(predicted_rating BETWEEN 0 AND 10),

    CHECK(predicted_revenue >=0)


) ENGINE=InnoDB;



-- ============================================================
-- COMPARISONS TABLE
-- ============================================================

CREATE TABLE comparisons (

    comparison_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNSIGNED NOT NULL,

    movie1_id INT UNSIGNED NOT NULL,

    movie2_id INT UNSIGNED NOT NULL,

    comparison_date DATE NOT NULL,


    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,


    FOREIGN KEY(movie1_id)
    REFERENCES movies(movie_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,


    FOREIGN KEY(movie2_id)
    REFERENCES movies(movie_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,


    UNIQUE(user_id,movie1_id,movie2_id,comparison_date)

) ENGINE=InnoDB;



-- ============================================================
-- FAVORITES TABLE
-- ============================================================

CREATE TABLE favorites (

    user_id INT UNSIGNED NOT NULL,

    movie_id INT UNSIGNED NOT NULL,


    PRIMARY KEY(user_id,movie_id),


    FOREIGN KEY(user_id)

    REFERENCES users(user_id)

    ON UPDATE CASCADE

    ON DELETE CASCADE,


    FOREIGN KEY(movie_id)

    REFERENCES movies(movie_id)

    ON UPDATE CASCADE

    ON DELETE CASCADE


) ENGINE=InnoDB;

INSERT INTO users
(username, email, password, created_at)
VALUES
('arjun_k', 'arjun@gmail.com', 'hash_password_01', '2025-01-05 09:15:00'),
('meera_s', 'meera@gmail.com', 'hash_password_02', '2025-01-12 11:30:00'),
('daniel_r', 'daniel@gmail.com', 'hash_password_03', '2025-02-03 14:20:00'),
('sophia_m', 'sophia@gmail.com', 'hash_password_04', '2025-02-18 16:45:00'),
('liam_j', 'liam@gmail.com', 'hash_password_05', '2025-03-07 10:05:00'),
('priya_n', 'priya@gmail.com', 'hash_password_06', '2025-03-22 13:50:00'),
('ethan_b', 'ethan@gmail.com', 'hash_password_07', '2025-04-11 08:40:00'),
('aisha_p', 'aisha@gmail.com', 'hash_password_08', '2025-04-29 17:10:00'),
('noah_w', 'noah@gmail.com', 'hash_password_09', '2025-05-16 12:25:00'),
('elena_g', 'elena@gmail.com', 'hash_password_10', '2025-06-02 15:35:00');

INSERT INTO movies
(title, genre, release_year, runtime, language, director, `cast`,
budget, revenue, rating, votes, popularity)
VALUES

('Inception',
'Science Fiction',
2010,
148,
'English',
'Christopher Nolan',
JSON_ARRAY('Leonardo DiCaprio','Joseph Gordon-Levitt'),
160000000,
839000000,
8.8,
2600000,
92.50),


('The Dark Knight',
'Action',
2008,
152,
'English',
'Christopher Nolan',
JSON_ARRAY('Christian Bale','Heath Ledger'),
185000000,
1006000000,
9.0,
3000000,
96.80),


('Interstellar',
'Science Fiction',
2014,
169,
'English',
'Christopher Nolan',
JSON_ARRAY('Matthew McConaughey','Anne Hathaway'),
165000000,
731000000,
8.7,
2200000,
94.30),


('Parasite',
'Thriller',
2019,
132,
'Korean',
'Bong Joon Ho',
JSON_ARRAY('Song Kang-ho','Lee Sun-kyun'),
11400000,
262700000,
8.5,
1050000,
89.60),


('Dangal',
'Sports Drama',
2016,
161,
'Hindi',
'Nitesh Tiwari',
JSON_ARRAY('Aamir Khan','Fatima Sana Shaikh'),
10000000,
311000000,
8.3,
220000,
78.40),


('Spirited Away',
'Animation',
2001,
125,
'Japanese',
'Hayao Miyazaki',
JSON_ARRAY('Rumi Hiiragi','Miyu Irino'),
19000000,
395800000,
8.6,
900000,
88.90),


('Gladiator',
'Historical Drama',
2000,
155,
'English',
'Ridley Scott',
JSON_ARRAY('Russell Crowe','Joaquin Phoenix'),
103000000,
503200000,
8.5,
1700000,
86.70),


('Coco',
'Animation',
2017,
105,
'English',
'Lee Unkrich',
JSON_ARRAY('Anthony Gonzalez','Gael Garcia'),
175000000,
814300000,
8.4,
620000,
84.20),


('The Godfather',
'Crime Drama',
1972,
175,
'English',
'Francis Ford Coppola',
JSON_ARRAY('Marlon Brando','Al Pacino'),
6000000,
250300000,
9.2,
2100000,
95.10),


('Mad Max Fury Road',
'Action',
2015,
120,
'English',
'George Miller',
JSON_ARRAY('Tom Hardy','Charlize Theron'),
150000000,
380400000,
8.1,
1150000,
87.30);

INSERT INTO predictions
(user_id, movie_name, genre, budget,
predicted_rating, predicted_revenue, prediction_date)
VALUES

(1,'Galactic Horizon','Science Fiction',
180000000,8.2,720000000,'2025-07-01'),

(2,'Silent Verdict','Crime Drama',
45000000,7.8,185000000,'2025-07-02'),

(3,'The Last Kingdom','Historical Drama',
110000000,8.0,430000000,'2025-07-03'),

(4,'Neon Shadows','Thriller',
65000000,7.6,240000000,'2025-07-04'),

(5,'Ocean Of Stars','Adventure',
140000000,8.4,610000000,'2025-07-05'),

(6,'Champion Within','Sports Drama',
30000000,7.9,150000000,'2025-07-06'),

(7,'Clockwork City','Animation',
95000000,8.1,390000000,'2025-07-07'),

(8,'Broken Compass','Mystery',
38000000,7.4,125000000,'2025-07-08'),

(9,'Fireline','Action',
125000000,7.7,505000000,'2025-07-09'),

(10,'Echoes Of Tomorrow','Science Fiction',
155000000,8.5,680000000,'2025-07-10');

INSERT INTO comparisons
(user_id, movie1_id, movie2_id, comparison_date)
VALUES

(1,1,3,'2025-07-11'),

(2,2,10,'2025-07-12'),

(3,4,9,'2025-07-13'),

(4,6,8,'2025-07-14'),

(5,5,7,'2025-07-15'),

(6,1,2,'2025-07-16'),

(7,3,6,'2025-07-17'),

(8,4,5,'2025-07-18'),

(9,7,10,'2025-07-19'),

(10,8,9,'2025-07-20');

INSERT INTO favorites
(user_id,movie_id)
VALUES

(1,1),

(2,2),

(3,3),

(4,4),

(5,5),

(6,6),

(7,7),

(8,8),

(9,9),

(10,10);


SELECT COUNT(*) FROM users;

SELECT COUNT(*) FROM movies;

SELECT COUNT(*) FROM predictions;

SELECT COUNT(*) FROM comparisons;

SELECT COUNT(*) FROM favorites;

SELECT * FROM users;

SELECT * FROM movies;

SELECT * FROM predictions;

SELECT * FROM comparisons;

SELECT * FROM favorites;