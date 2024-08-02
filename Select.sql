-- Название и продолжительность самого длительного трека
SELECT title, duration
FROM tracks 
WHERE duration = (SELECT max(duration) FROM tracks );

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM tracks 
WHERE duration >= '00:03:30';

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM collections
WHERE release_date BETWEEN '2018-01-01' AND '2020-01-01';

-- Исполнители, чьё имя состоит из одного слова
SELECT "name" 
FROM artists
WHERE "name" NOT LIKE ('% %');

-- Название треков, которые содержат слово «мой» или «my»
SELECT title 
FROM tracks 
WHERE title LIKE ('%my%');

-- Количество исполнителей в каждом жанре
SELECT a2.title,  count(artist_id) 
FROM artistsgenres a 
JOIN genres a2 ON a.genre_id = a2.genre_id 
GROUP BY a.genre_id, a2.title 
ORDER BY a.genre_id 

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(track_id)
FROM albums a 
JOIN tracks t ON a.album_id = t.album_id 
WHERE release_date BETWEEN '2019-01-01' AND '2020-12-31' 

-- Средняя продолжительность треков по каждому альбому
SELECT a.title, AVG(duration) 
FROM albums a 
JOIN tracks t ON a.album_id = t.album_id 
GROUP BY a.title 

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT "name" 
FROM albums a 
JOIN albumsartists a2 ON a.album_id = a2.album_id 
JOIN artists a3 ON a2.album_id = a3.artist_id 
WHERE release_date NOT BETWEEN '2020-01-01' AND '2020-12-31'

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT c.title 
FROM collections c 
JOIN trackscollections t ON c.collection_id = t.collection_id
JOIN tracks t2 ON t2.track_id = t.track_id 
JOIN albums a ON a.album_id = t2.album_id 
JOIN albumsartists a2 ON a.album_id = a2.album_id 
JOIN artists a3 ON a2.artist_id = a3.artist_id 
WHERE a3."name" = 'Rammstein'