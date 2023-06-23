-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- One major improvement you could make is to create a customer_information table, add a customer_id to each ticket and provide information
-- on each customer in that table. You could further shorten the table by creating a locations table, removing the from/to_city/country and 
-- providing a single id for each (rather than two columns for each)

CREATE TABLE customer_information
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customer_information,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  departure_location_id INTEGER REFERENCES locations,
  arrival_location_id INTEGER REFERENCES locations
);

INSERT INTO customer_information
  (first_name, last_name)
  VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO locations
  (city, country)
  VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');


INSERT INTO tickets
  (customer_id, seat, departure, arrival, airline, departure_location_id, arrival_location_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 4),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 6),
  (4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 7),
  (5, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 9),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 11),
  (6, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 13),
  (7, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 14, 15),
  (6, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 13, 16),
  (8, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 18);