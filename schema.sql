
DROP TABLE IF EXISTS list, stats;

CREATE TABLE list (
  id SERIAL PRIMARY KEY,
  activity VARCHAR(255)
);

CREATE INDEX taskList ON list(activity);

-- CREATE TABLE comments (
--   id SERIAL PRIMARY KEY,
--   comment VARCHAR(255),
--   grocery_id INTEGER REFERENCES groceries (id)
-- );

CREATE TABLE stats (
  id SERIAL PRIMARY KEY,
  user VARCHAR(50),
  tasksFinished INTEGER,
  tasksNotFinished INTEGER
);

CREATE INDEX names on stats(user);
-- Learn to store session data to extract db list of only the user
