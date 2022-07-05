CREATE TABLE IF NOT EXISTS ratings (
    rating_id           integer         GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    rating_name         varchar(255)    NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS genres (
    genre_id            integer         GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    genre_name          varchar(255)    NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS films (
    film_id             integer         GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    film_name           varchar(255)    NOT NULL,
    film_description    varchar(255),
    film_release_date   date,
    film_duration       integer,
    film_rating_id      integer,
    FOREIGN KEY (film_rating_id)
            REFERENCES ratings (rating_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS film_genres (
    film_id             integer         NOT NULL,
    genre_id            integer         NOT NULL,
    FOREIGN KEY (film_id)
            REFERENCES films
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    FOREIGN KEY (genre_id)
            REFERENCES genres
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    PRIMARY KEY (film_id, genre_id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id             integer         GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_email          varchar(255)    NOT NULL UNIQUE,
    user_login          varchar(255)    NOT NULL UNIQUE,
    user_name           varchar(255)    NOT NULL,
    user_birthday       date
);

CREATE TABLE IF NOT EXISTS films_liked (
    user_id             integer         NOT NULL,
    film_id             integer         NOT NULL,
    FOREIGN KEY (user_id)
            REFERENCES users
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    FOREIGN KEY (film_id)
            REFERENCES films
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    PRIMARY KEY (user_id, film_id)
);

CREATE TABLE IF NOT EXISTS friendships (
    from_id         integer         NOT NULL,
    to_id           integer         NOT NULL,
    is_approved     boolean         NOT NULL DEFAULT false,
    FOREIGN KEY (from_id)
            REFERENCES users (user_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    FOREIGN KEY (to_id)
            REFERENCES users (user_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    PRIMARY KEY (from_id, to_id)
);
