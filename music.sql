-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artists TEXT NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  albumtitle TEXT NOT NULL,
  songid INTEGER REFERENCES songs(id),
  producers TEXT NOT NULL,
  release_date DATE NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, artists)
VALUES
  ('MMMBop', 238, '{"Hanson"}'),
  ('Bohemian Rhapsody', 355,  '{"Queen"}'),
  ('One Sweet Day', 282, '{"Mariah Cary", "Boyz II Men"}'),
  ('Shallow', 216,  '{"Lady Gaga", "Bradley Cooper"}'),
  ('How You Remind Me', 223,  '{"Nickelback"}'),
  ('New York State of Mind', 276,  '{"Jay Z", "Alicia Keys"}'),
  ('Dark Horse', 215, '{"Katy Perry", "Juicy J"}'),
  ('Moves Like Jagger', 201,  '{"Maroon 5", "Christina Aguilera"}'),
  ('Complicated', 244,'{"Avril Lavigne"}'),
  ('Say My Name', 240, '{"Destiny''s Child"}');


INSERT INTO album
(albumtitle,songid,producers,release_date)
VALUES
('Middle of Nowhere',1,'{"Dust Brothers", "Stephen Lironi"}','04-15-1997'),('A Night at the Opera',2,'{"Roy Thomas Baker"}','10-31-1975'),
('Daydream',3, '{"Walter Afanasieff"}','11-14-1995'),('A Star Is Born',4,'{"Benjamin Rice"}','09-27-2018'),( 'Silver Side Up',5,'{"Rick Parashar"}','08-21-2001'),
('The Blueprint 3',6,'{"Al Shux"}','10-20-2009'),( 'Prism',7,'{"Max Martin", "Cirkut"}','12-17-2013'),('Hands All Over',8,'{"Shellback", "Benny Blanco"}','06-21-2011'),
( 'Let Go',9,'{"The Matrix"}','05-14-2002'),('The Writing''s on the Wall',10,'{"Darkchild"}','11-07-1999');


