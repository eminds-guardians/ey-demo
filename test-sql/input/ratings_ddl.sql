DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings(
    name  VARCHAR(220) NOT NULL,
    author  VARCHAR(93) NOT NULL,
    narrator VARCHAR(120) NOT NULL,
    time  VARCHAR(19) NOT NULL,
    releasedate VARCHAR(16)  NOT NULL,
    language VARCHAR(16) NOT NULL,
    stars VARCHAR(31) NOT NULL,
    price  VARCHAR(8) NOT NULL
    );