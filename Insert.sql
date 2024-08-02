-- Исполнители
INSERT INTO artists (artist_id, "name")
VALUES (1, 'Billie Eilish'),
	   (2, 'Rammstein'),
	   (3, 'Skrillex'), 
	   (4, 'Maroon 5');

-- Жанры
INSERT INTO genres (genre_id, title)
VALUES (1, 'pop'),
	   (2, 'metal'),
	   (3, 'dubstep'),
	   (4, 'pop-rock');   
   
-- Альбомы
INSERT INTO albums (album_id, title, release_date)
VALUES (1, 'When We All Fall Asleep, Where Do We Go?', '2019-03-29'),
	   (2, 'Rammstein', '2019-03-17'),	   
	   (3, 'Bangarang EP', '2011-12-23'),	  
	   (4, 'Hands All Over', '2010-09-15');
  
-- Треки
INSERT INTO tracks (track_id , title , duration, album_id)
VALUES (1, 'Bad Guy', '00:03:14', 1),
	   (2, 'Deutschland', '00:05:23', 2),
	   (3, 'Radio', '00:04:37', 2),
	   (4, 'Bangarang', '00:03:35', 3),
	   (5, 'Kyoto', '00:03:21', 3),
	   (6, 'Misery', '00:03:36', 4),
	   (7, 'Moves Like Jagger', '00:03:19', 4);
	   
-- Сборники
INSERT INTO collections (collection_id , title, release_date)
VALUES (1, 'The Best Summer Album In The World...Ever!', '2021-06-18'),
	   (2, 'Rock to your playlist!', '2019-09-20'),	   
	   (3, 'The Best Dubstep', '2012-05-17'),
	   (4, 'Trending Hits 2022', '2022-02-14'),
	   (5, 'Smash Hits 2010', '2010-11-23');	  
	  
-- Связь Исполнители - Жанры
INSERT INTO artistsgenres (artist_id, genre_id)
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 1),
	   (4, 4);
	   
-- Связь Альбомы - Артисты
INSERT INTO albumsartists (album_id, artist_id)
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4);
	   
-- Связь Треки - Сборники
INSERT INTO trackscollections (track_id, collection_id)
VALUES (1, 1),
	   (1, 4),
	   (2, 2),
	   (3, 2),
	   (3, 4),
	   (4, 3),
	   (5, 3),
	   (6, 4),
	   (7, 5),
	   (7, 1);
	   