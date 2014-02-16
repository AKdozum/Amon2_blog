PRAGMA foreign_keys=ON; --https://www.sqlite.org/foreignkeys.html
CREATE TABLE IF NOT EXISTS member (
    id           INTEGER NOT NULL PRIMARY KEY,
    name         VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS entry (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    body TEXT not null,
    created DATETIME,
    FOREIGN KEY(id) REFERENCES member(id)
);

CREATE TABLE IF NOT EXISTS comment (
    id           INTEGER NOT NULL PRIMARY KEY,
    name         VARCHAR(255),
    body         TEXT not null,
    created      DATETIME,
    FOREIGN KEY(id) REFERENCES entry(id)
);
