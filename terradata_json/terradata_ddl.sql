CREATE TABLE ratings_cleaned(
   name        VARCHAR(220) NOT NULL,
   author      VARCHAR(93) NOT NULL,
   narrator    VARCHAR(120) NOT NULL,
   time        VARCHAR(19) NOT NULL,
   releasedate DATE  NOT NULL,
   language    VARCHAR(16) NOT NULL,
   stars       VARCHAR(31) NOT NULL,
   price       VARCHAR(8) NOT NULL
   j JSON CHARACTER SET LATIN
);