-- Due to time constraints, I had to leave my work as is. I accounted for everything except ranking teams within each season.
-- As it stands, the tables can provide start and end dates for each season, track each team, tell which players scored which goals,
-- indicate which referee presided over a specific match, and much more.

DROP DATABASE IF EXISTS soccer_data;

CREATE DATABASE soccer_data;

\c soccer_data;

CREATE TABLE seasons
  (id SERIAL PRIMARY KEY,
  yr INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
  );

CREATE TABLE teams
  (id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL
  );

CREATE TABLE players
  (id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  team_id INTEGER REFERENCES teams,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
  );

CREATE TABLE referees
  (id SERIAL PRIMARY KEY,
  referee_name TEXT NOT NULL
  );

CREATE TABLE matches
  (id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  season_id INTEGER REFERENCES seasons,
  team_1 INTEGER REFERENCES teams,
  team_2 INTEGER REFERENCES teams,
  referee_id INTEGER REFERENCES referees,
  score TEXT NOT NULL,
  outcome TEXT NOT NULL
  );

CREATE TABLE goals
  (id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams,
  player_id INTEGER REFERENCES players,
  season_id INTEGER REFERENCES seasons,
  match_id INTEGER REFERENCES matches
  );