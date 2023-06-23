DROP DATABASE IF EXISTS craigslist_app;

CREATE DATABASE craigslist_app;

\c craigslist_app;

CREATE TABLE regions
  (id SERIAL PRIMARY KEY,
  name TEXT NOT NULL);

CREATE TABLE users
  (id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  preferred_region INTEGER REFERENCES regions);

CREATE TABLE locations
  (id SERIAL PRIMARY KEY,
  address TEXT NOT NULL);

CREATE TABLE posts
  (id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users,
  region_id INTEGER REFERENCES regions,
  location_id INTEGER REFERENCES locations,
  title TEXT NOT NULL,
  body_text TEXT NOT NULL);

CREATE TABLE categories
  (id SERIAL PRIMARY KEY,
  name TEXT NOT NULL);

CREATE TABLE categories_posts
  (id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts,
  category_id INTEGER REFERENCES categories);

INSERT INTO regions
  (name)
  VALUES
  ('Seattle'), 
  ('Atlanta'), 
  ('New York'), 
  ('Los Angeles'), 
  ('San Francisco'), 
  ('Dallas'), 
  ('Washington D.C.');

INSERT INTO users
  (username, preferred_region)
  VALUES
  ('somechickenguy86', 5), 
  ('newuser', 2), 
  ('redditor96', 4), 
  ('somethingsomething1', 3);

INSERT INTO locations
  (address)
  VALUES
  ('Druid Hills, GA'),
  ('San Francisco, CA'),
  ('Orange County, CA'),
  ('Long Island, NY');

INSERT INTO posts
  (user_id, region_id, location_id, title, body_text)
  VALUES
  (1, 5, 2, 'My Chickens', 'Willing to let others come and see my chickens.'),
  (2, 2, 1, 'My first post', 'Hi Craigslist, I am just posting this as a test.'),
  (3, 4, 3, 'Free couch', 'I just got a new couch and am willing to give my old one away.'),
  (4, 3, 4, 'Need a Spanish tutor', 'Long story short, I need to learn Spanish ASAP. Only contact me if you are fluent.');

INSERT INTO categories
  (name)
  VALUES
  ('Selling'),
  ('Miscellaneous'),
  ('Looking for'),
  ('Hiring');

INSERT INTO categories_posts
  (post_id, category_id)
  VALUES
  (1, 2),
  (2, 2),
  (3, 1),
  (4, 3),
  (4, 4);