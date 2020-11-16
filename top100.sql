--Desafío Peliculas
-- 1. Crear base de datos llamada películas (1 punto)
CREATE DATABASE peliculas;

-- 2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,
-- determinando la relación entre ambas tablas. (2 puntos)
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
     FOREIGN KEY (id_r) REFERENCES mpvies(id) );
);

-- 3. Cargar ambos archivos a su tabla correspondiente (1 punto)
 
\copy movies FROM '/Users/andresmunozg./Desktop/base-de-datos/clase2/peliculas.csv' csv [header];

\copy reparto FROM '/Users/andresmunozg./Desktop/base-de-datos/clase2/reparto.csv' csv [header];

-- 4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,
-- año de estreno, director y todo el reparto. (0.5 puntos)

SELECT movies.pelicula, movies.ano_estreno, movies.director, reparto.actor  
FROM movies   
INNER JOIN reparto   
ON movies.id = reparto.id_r;

