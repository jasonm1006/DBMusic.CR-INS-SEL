-- Создание таблицы Исполнители
CREATE TABLE IF NOT EXISTS artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Создание таблицы Жанры
CREATE TABLE IF NOT EXISTS genres (
	genre_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);

-- Создание связи многие ко многим Исполнители - Жанры
CREATE TABLE IF NOT EXISTS artistsgenres (
	artist_id INTEGER REFERENCES artists(artist_id),
	genre_id INTEGER REFERENCES genres(genre_id),
	CONSTRAINT pk1 PRIMARY KEY (artist_id, genre_id) 
);

-- Создание таблицы Альбомы
CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	release_date DATE NOT NULL
	CHECK (release_date >= DATE('2000-01-01')) 
);

-- Создание связи многие ко многим Альбомы - Исполнители
CREATE TABLE IF NOT EXISTS albumsartists (
	album_id INTEGER REFERENCES albums(album_id),
	artist_id INTEGER REFERENCES artists(artist_id),
	CONSTRAINT pk2 PRIMARY KEY (album_id, artist_id)
);

-- Создание таблицы Треки
CREATE TABLE IF NOT EXISTS tracks (
	track_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	duration INTERVAL NOT NULL,
	CHECK (duration >= INTERVAL '30' SECOND AND duration <= INTERVAL '10' MINUTE),
	album_id INTEGER REFERENCES albums(album_id)
);

-- Создание таблицы Сборники
CREATE TABLE IF NOT EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	release_date DATE NOT NULL
	CHECK (release_date >= DATE('2000-01-01')) 
);

-- Создание связи многие ко многим Треки - Сборники
CREATE TABLE IF NOT EXISTS trackscollections (
	track_id INTEGER REFERENCES tracks(track_id),
	collection_id INTEGER REFERENCES collections(collection_id),
	CONSTRAINT pk3 PRIMARY KEY (track_id, collection_id)
);
	