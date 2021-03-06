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
     FOREIGN KEY (id_r) REFERENCES movies(id)
);

-- 3. Cargar ambos archivos a su tabla correspondiente (1 punto)
 
\copy movies FROM '/Users/andresmunozg./Desktop/base-de-datos/clase2/peliculas.csv' csv HEADER;

\copy reparto FROM '/Users/andresmunozg./Desktop/base-de-datos/clase2/reparto.csv' csv HEADER;

-- 4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,
-- año de estreno, director y todo el reparto. (0.5 puntos)

SELECT movies.pelicula, movies.ano_estreno, movies.director, reparto.actor  
FROM movies   
INNER JOIN reparto   
ON movies.id = reparto.id_r AND movies.id = 2;

-- 5. Listar los titulos de las películas donde actúe Harrison Ford.(0.5 puntos)

SELECT movies.pelicula, reparto.actor  
FROM movies   
INNER JOIN reparto   
ON movies.id = reparto.id_r AND reparto.actor = 'Harrison Ford';

-- 6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el
-- top 100.(1 puntos)

SELECT director, COUNT (director) AS cantidad_peliculas
FROM movies
GROUP BY director
ORDER BY cantidad DESC
LIMIT 10;

-- 7. Indicar cuantos actores distintos hay (1 puntos)

SELECT COUNT(DISTINCT actor) AS cantidad_de_actores_unicos
FROM reparto;

-- 8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por
-- título de manera ascendente.(1 punto)

SELECT pelicula, ano_estreno 
FROM movies
WHERE ano_estreno BETWEEN 1990 AND 1999
ORDER BY pelicula DESC;

-- 9. Listar el reparto de las películas lanzadas el año 2001 (1 punto)

SELECT movies.pelicula, movies.ano_estreno, reparto.actor  
FROM movies   
INNER JOIN reparto   
ON movies.id = reparto.id_r AND movies.ano_estreno = 2001;

-- 10. Listar los actores de la película más nueva (1 punto)

SELECT movies.pelicula, movies.ano_estreno, reparto.actor  
FROM movies   
INNER JOIN reparto   
ON movies.id = reparto.id_r 
ORDER BY movies.ano_estreno DESC
LIMIT 22;

-- TERMINADOS