CREATE TABLE IF NOT EXISTS event_type
(
    id    BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) UNIQUE
    );

INSERT INTO event_type (title, color)
VALUES ('task.primary', '#b8daff');
INSERT INTO event_type (title, color)
VALUES ('task.success', '#c3e6cb');
INSERT INTO event_type (title, color)
VALUES ('task.danger', '#f5c6cb');
INSERT INTO event_type (title, color)
VALUES ('task.warning', '#ffeeba');

ALTER TABLE task
    RENAME TO event;

ALTER TABLE event
    ADD COLUMN IF NOT EXISTS description TEXT,
    ADD COLUMN IF NOT EXISTS event_type  BIGINT NOT NULL REFERENCES event_type (id) DEFAULT 1;

CREATE TABLE IF NOT EXISTS navbar_link
(
    id      BIGSERIAL PRIMARY KEY,
    title   VARCHAR NOT NULL,
    href    VARCHAR NOT NULL,
    active  BOOLEAN NOT NULL DEFAULT TRUE,
    color   VARCHAR,
    "order" INTEGER
);

INSERT INTO navbar_link (title, href, "order")
VALUES ('link.home', '#', 0);