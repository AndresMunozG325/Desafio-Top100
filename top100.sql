--Desafío Peliculas

CREATE DATABASE peliculas;

CREATE TABLE movies( 
     id INT, 
     pelicula VARCHAR(255), 
     ano_estreno INT,
     director VARCHAR(255),
     PRIMARY KEY (id)
);

CREATE TABLE reparto( 
     id_r INT, 
     actor VARCHAR(255), 
     PRIMARY KEY (id_r)
);
