CREATE TABLE IF NOT EXISTS role
(
    id   BIGSERIAL PRIMARY KEY,
    role VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS "user"
(
    id         BIGSERIAL PRIMARY KEY,
    username   VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    expired    BOOLEAN DEFAULT FALSE,
    "locked"   BOOLEAN DEFAULT FALSE
    );

CREATE TABLE IF NOT EXISTS m2m_user_role
(
    user_id BIGINT REFERENCES "user" (id) ON UPDATE CASCADE ON DELETE NO ACTION,
    role_id BIGINT REFERENCES role (id) ON UPDATE CASCADE ON DELETE NO ACTION
    );

INSERT INTO role (role)
VALUES ('ADMIN'),
       ('USER');

INSERT INTO "user" (id, username, password)
VALUES (1, 'zlobbi', '$2a$10$Giwvf.tcKyRHVlaoEAU0IuaKswV.//pPhOE9.6AMr/VZ1Sw860LN6');

INSERT INTO m2m_user_role (user_id, role_id)
VALUES (1, 1),
       (1, 2);

ALTER TABLE event
    ADD COLUMN IF NOT EXISTS user_id BIGINT REFERENCES "user" (id) ON UPDATE CASCADE ON DELETE NO ACTION;
