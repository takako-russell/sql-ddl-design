-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  cityname TEXT UNIQUE NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  countryname TEXT UNIQUE NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airlinenames TEXT UNIQUE NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines(id),
  from_cityid INTEGER  REFERENCES cities(id),
  from_countryid INTEGER REFERENCES countries(id),
  to_cityid INTEGER  REFERENCES cities(id),
  to_countryid  INTEGER REFERENCES countries(id)
);





INSERT INTO cities (cityname)
VALUES
('Washington DC'),('Seattle'),('Tokyo'),('London'),('Los Angeles'),('Las Vegas'),('Mexico City'),('Paris'),('Casablanca'),('Dubai'),('Beijing'),('New York'),('Cedar Rapids'),('Chicago'),('Charlotte'),('New Orleans'),( 'Sao Paolo'),('Santiago');

INSERT INTO countries (countryname)
VALUES
( 'United States'),('United Kingdom'),('Japan'),('Mexico'),('France'),( 'Morocco'),('UAE'),('China'),('Brazil'),('Chile');

INSERT INTO airlines(airlinenames)
VALUES
('United'),('British Airways'),('Delta'),('TUI Fly Belgium'),('Air China'),('American Airlines'),('Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_cityid, from_countryid, to_cityid, to_countryid)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2,3, 3, 4, 2),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00',4 , 8, 5, 9, 6),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 11, 7, 12, 8),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 13, 1, 14, 1),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 16, 1, 17, 1),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00',7 , 18, 9, 18, 10);