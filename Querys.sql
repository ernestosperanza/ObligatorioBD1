/*------------------------------------------------------------------------------
 EJ1: Obtener el email y nickname de aquellos usuarios que emitieron contenido 
 de las categorías Música o Fortnite, pero no ambas. Considerar solo 
 contenidos de mayo de 2022.
 
 Justificación: Primero creamos dos grupos donde seleccionamos aquellos usuarios
 que tengan contenido en Fortnite o Musica. Luego los unimos y restamos aquellos
 que tengan ambos grupos, nos quedamos con los restantes, si cumplen con los 
 filtros del mes y el año.
------------------------------------------------------------------------------*/
(SELECT con.emailusuario,
        u.nickname
 FROM   contenido con,
        usuario u,
        categoria cat
 WHERE  con.emailusuario = u.email
        AND con.codcategoria = cat.codcategoria
        AND cat.nombrecategoria = 'Fortnite'
        AND Extract (year FROM con.fechaemision) = 2022
        AND Extract (month FROM con.fechaemision) = 5
 UNION
 SELECT con.emailusuario,
        u.nickname
 FROM   contenido con,
        usuario u,
        categoria cat
 WHERE  con.emailusuario = u.email
        AND con.codcategoria = cat.codcategoria
        AND cat.nombrecategoria = 'Musica'
        AND Extract (year FROM con.fechaemision) = 2022
        AND Extract (month FROM con.fechaemision) = 5)
minus
(SELECT con.emailusuario,
        u.nickname
 FROM   contenido con,
        usuario u,
        categoria cat
 WHERE  con.emailusuario = u.email
        AND con.codcategoria = cat.codcategoria
        AND cat.nombrecategoria = 'Fortnite'
        AND Extract (year FROM con.fechaemision) = 2022
        AND Extract (month FROM con.fechaemision) = 5
 INTERSECT
 SELECT con.emailusuario,
        u.nickname
 FROM   contenido con,
        usuario u,
        categoria cat
 WHERE  con.emailusuario = u.email
        AND con.codcategoria = cat.codcategoria
        AND cat.nombrecategoria = 'Musica'
        AND Extract (year FROM con.fechaemision) = 2022
        AND Extract (month FROM con.fechaemision) = 5);
/*------------------------------------------------------------------------------
 EJ2: Obtener el título de los contenidos de la categoría "Música" que tuvieron 
 visualizaciones de otros usuarios distintos al creador, en el mes de mayo 
 de 2022, y cuyo dominio sea Privado.
 
 Justificación: Recopilamos aquellos contenidos que cumplen ser de la categoria 
 'Musica' verificando que tengan al menos una visualizacion de alguien diferente
 al usuario original independientemente de que este lo haya visto y ademas 
 cumple con los filtros de mes y año.
------------------------------------------------------------------------------*/
SELECT c.titulo
FROM   visualizacion v,
       contenido c
WHERE  c.dominio = 'PRIVADO'
       AND v.codcontenido = c.codcontenido
       AND Extract (year FROM c.fechaemision) = 2022
       AND Extract (month FROM c.fechaemision) = 5
       AND c.codcategoria = '4'
       AND c.emailusuario != v.emailusuario;
/*------------------------------------------------------------------------------
 EJ3: Obtener el o los contenidos más antiguos de la categoría LoL. Para cada  
 uno mostrar su título y el email y nickname del usuario creador.             
 Considerar solo contenidos de dominio público y que hayan sido visualizados  
 al menos una vez.  
 
 Justificación: Primero hicimos una sub query la cual toma la menor fecha de 
 aquellos contenidos los cuales cumplen ser de la categoria LoL y además son 
 públicos. Luego tomamos esa fecha, el dominio y el usuario, para devolver 
 lo que se pide en la letra(titulo,mail y nick).
------------------------------------------------------------------------------*/
SELECT DISTINCT c.titulo,
                c.emailusuario,
                u.nickname
FROM   usuario u,
       contenido c,
       visualizacion v
WHERE  u.email = c.emailusuario
       AND v.codcontenido = c.codcontenido
       AND c.codcategoria = '2'
       AND c.dominio = 'PUBLICO'
       AND c.fechaemision = (SELECT Min(c.fechaemision)
                             FROM   contenido c
                             WHERE  c.codcategoria = '2'
                             AND c.dominio = 'PUBLICO');
/*------------------------------------------------------------------------------
 EJ4: Mostrar los nicknames de los usuarios que hayan recibido más de una 
 donación cuyo estado sea pendiente y que a su vez hayan donado a más de un 
 usuario.Considerar las donaciones posteriores al 10/10/2021.
 
 Justificación: Hicimos una sub-query que nos permite identificar la cantidad 
 de donaciones que tiene un email de destino, y a su vez la comparamos con la 
 informacion filtrada originalmente para saber si existe un email que cumpla 
 con esas condiciones dentro de la union entre donacion y usuario.
------------------------------------------------------------------------------*/
SELECT DISTINCT u.nickname
FROM   donacion d,
       usuario u
WHERE  d.emailorigen = u.email
       AND d.estadodonacion = 'PENDIENTE'
       AND d.fechacreacion > '10/10/2021'
       AND d.emailorigen IN (SELECT emailorigen
                             FROM   donacion
                             GROUP  BY emailorigen
                             HAVING Count(emaildestino) > 1);
/*------------------------------------------------------------------------------                 
 EJ5: Obtener el email y nickname de los usuarios mayores de 18 años que hayan 
 emitido contenido de todas las categorías. Considerar únicamente aquellos 
 contenidos cuyo dominio sea público.
 
 Justificación: Primero utilizamos una funcion innata del sql para calcular la
 edad que seria el primer filtro de la consulta en cuestion, luego chequeamos 
 que el email de dicho usuario este dentro de la tabla contenido y cumpla con 
 los respectivos filtros. Finalmente nos aseguramos con la ultima sub query 
 que el usuario tenga todas las categorías.
------------------------------------------------------------------------------*/
SELECT u.email,
       u.nickname
FROM   usuario u
-- Validamos que el usuario sea mayor de 18: 18*365=6570
-- Esta cuenta no considera años biciestos @manu
WHERE  Trunc(sysdate - fechanac) > '6570'
       AND u.email IN (SELECT emailusuario
                       FROM   contenido
                       WHERE  dominio = 'PUBLICO'
                       GROUP  BY emailusuario
                       HAVING Count(DISTINCT codcategoria) =
                              -- Cuento el total de las categorias
                              (SELECT Sum(Count(DISTINCT codcategoria))
                               FROM   contenido
                               GROUP  BY codcategoria));
/*------------------------------------------------------------------------------
 EJ6: Proveer una consulta que muestre los siguientes datos de las donaciones: 
 EmailOrigen,EmailDestino, Fecha y EstadoDonación. Para las donaciones 
 aprobadas mostrar la fecha y para las pendientes mostrar el texto 
 “Transacción programada”. Considerar aquellos usuarios cuyo nickname tenga por 
 lo menos 5 letras de longitud.
 
 Justificación: Primero hicimos una sub query que toma aquellos nicks de 
 usuarios cuyo largo es mayor o igual a 5. Luego hicimos una union entre usuario
 y donacion, donde nos quedamos con una tabla de donaciones, la cual proyecta
 si esta pendiente o es aprobada, la fecha y ademas incluye un case para 
 aplicar las transacciones programadas.
------------------------------------------------------------------------------*/
SELECT emailorigen    AS EmailOrigen,
       emaildestino   AS EmailDestino,
       CASE
         WHEN fechaacreditacion IS NULL THEN 'Transaccion programada'
         ELSE To_char(fechaacreditacion, 'DD/MM/YY')
       END            AS Fecha,
       estadodonacion AS EstadoDonacion
FROM   donacion d,
       usuario u
WHERE  u.email = d.emailorigen
       AND u.nickname IN (SELECT nickname
                          FROM   usuario
                          WHERE  Length(nickname) >= 5);
/*------------------------------------------------------------------------------
 EJ7: Obtener para cada usuario la cantidad de contenidos de dominio público 
 y privado que emitió. Considerar solamente los contenidos emitidos en la 
 primera quincena de marzo de 2022.
 
 Justificación: Desplegamos una tabla, la cual muestra aquellos emails de 
 usuarios con sus respectivas emisiones de contenido privado y publico 
 desplegando estas como listas contables calculadas usando el case, siempre 
 y cuando se cumpla el filtro dado por fecha.
------------------------------------------------------------------------------*/
SELECT c.emailusuario AS Email,
       Count(CASE
               WHEN c.dominio = 'PRIVADO' THEN 1
             END)     AS ContPrivado,
       Count(CASE
               WHEN c.dominio = 'PUBLICO' THEN 1
             END)     AS ContPublico
FROM   contenido c
WHERE  c.fechaemision < '16/03/22'
       AND c.fechaemision >= '01/03/22'
GROUP  BY c.emailusuario;
/*------------------------------------------------------------------------------
 EJ8: Obtener el nombre y fecha de nacimiento de los usuarios que visualizaron 
 la mayor cantidad de contenido en abril de 2022 y que nunca hayan 
 recibido donaciones.   
 
 Justificación: Primero hicimos una subquery, la cual toma todos los emails de 
 las donaciones, y dada la tabla de visualizaciones tomamos el maximo de los 
 emails que no estan en aquella mencionada primeramente.
 Luego comparamos el email de los usuarios con aquellos recopilados 
 anteriormente para devolver su nombre y fecha de nacimiento.
------------------------------------------------------------------------------*/
SELECT u.nombre   AS Nombre,
       u.fechanac AS FechaNac
FROM   usuario u
WHERE  u.email IN (SELECT emailusuario
                   FROM   visualizacion
                   GROUP  BY emailusuario
-- Busca el maximo de visualizaciones de los que no tienen donaciones
                   HAVING Count(*) = (SELECT Max(Count(*))
                                      FROM   visualizacion
                                      WHERE  emailusuario NOT IN
                                      -- Lista de los que recibieron donaciones
                                             (SELECT DISTINCT emaildestino
                                              FROM   donacion)
                                      AND Extract (year FROM fecha) = 2022
                                      AND Extract (month FROM fecha) = 4
                                      GROUP  BY emailusuario)); 
/*------------------------------------------------------------------------------
 EJ9: Obtener el nombre de la categoría para la cual se haya emitido la menor 
 cantidad de contenido y que alguno de esos contenidos haya tenido la mayor 
 cantidad de visualizaciones. Considerar solamente contenidos públicos 
 y que se hayan subido hace 15 días.
 
 Justificación: Primero hacemos una subquery para obtener el mínimo de 
 contenidos emitidos por categoría. Luego filtramos las categorías que tienen 
 ese mínimo. Por último unimos la tabla de categoría con contenido y 
 seleccionamos los contenidos que estén en la tabla de categorías fitrada 
 anterior a su vez agrupamos esto y seleccionamos solo el valor primero, de esta 
 forma nos aseguramos de tener la categoría que cumple con todas las condiciones
------------------------------------------------------------------------------*/
-- Traer nombre de categoria
-- Lista con los videos con mas visualizaciones
SELECT cat.nombrecategoria AS NombreCategoria
FROM contenido c,
     categoria cat
WHERE cat.codcategoria = c.codcategoria
      AND c.fechaemision > trunc(sysdate-15)
      AND c.dominio = 'PUBLICO'
-- Filtrar la categoria que tiene menos emisiones
      AND c.codcategoria IN (SELECT cat.codcategoria
                              FROM   contenido c,
                                     categoria cat
                              WHERE  c.codcategoria = cat.codcategoria
                                     AND c.dominio = 'PUBLICO'
                                     AND fechaemision > trunc(sysdate-15)
                              GROUP  BY cat.nombrecategoria,
                                        cat.codcategoria
                              HAVING COUNT(*) = (SELECT MIN(COUNT(*))
                                                 FROM   contenido
                                                 WHERE  dominio = 'PUBLICO'
                                                 AND fechaemision > trunc(sysdate-15)
                                                 GROUP  BY codcategoria))
GROUP  BY c.codcontenido,
          c.codcategoria,
          cat.nombrecategoria
ORDER  BY COUNT(*) desc
FETCH first 1 ROWS only;
/*------------------------------------------------------------------------------
 EJ10: Obtener para cada dominio (Público y Privado): los usuarios que han 
 emitido contenido con dicho dominio y la cantidad total de emisiones por 
 usuario para ese dominio. Obtener el porcentaje que representan estas 
 cantidades sobre el total de contenidos emitidos para cada dominio. 
 Además, obtener el nombre de la categoría que obtuvo la mayor cantidad de 
 visualizaciones para cada dominio de contenido.
 
 Justificación: Primero hicimos una union entre contenido y categoria, 
 de donde el contenido fuese privado/publico y categoria, contenido tuviesen el 
 mismo codigo. De ahi pudimos sacar el maximo de estas para desplegarlo como 
 parte de las emisiones del Dominio. Luego utilizamos un case para calcular 
 los porcentajes de la cantidad de emisiones de cada usuario dictado por la
 consulta.
------------------------------------------------------------------------------*/
SELECT c.dominio AS Dominio,
       u.nombre  AS NombreUsuario,
       COUNT(*)  AS CantidadEmisiones,
       -- PrcEmisiones | Hacer el campo calculado
       -- totalDelUsuario / totalDelasVisualizacionesPorDominio *100
      CASE 
         WHEN c.dominio = 'PUBLICO' THEN 
            CONCAT(to_char(round(COUNT(*) / (SELECT COUNT(*) 
                                             FROM contenido 
                                             WHERE dominio = 'PUBLICO') 
                                             * 100)),'%') 
         WHEN c.dominio = 'PRIVADO' THEN 
            CONCAT(to_char(round(COUNT(*) / (SELECT COUNT( *) 
                                             FROM contenido 
                                             WHERE dominio = 'PRIVADO')
                                             * 100)), '%') 
      END AS prcemisiones ,
       /* Categorias Publica | Privada
          Pueden haber categorias empatadas en ese caso traemos la primera
          Asumimos que ese es el comportamiento correcto */
       CASE
         WHEN c.dominio = 'PUBLICO' THEN
       ---- Publica ----
       (SELECT cat.nombrecategoria
        FROM   contenido c,
               categoria cat
        WHERE  c.dominio = 'PUBLICO'
               AND c.codcategoria = cat.codcategoria
        GROUP  BY c.codcategoria,
                  cat.nombrecategoria
        HAVING COUNT(*) = (SELECT Max(COUNT(*))
                           FROM   contenido c
                           WHERE  c.dominio = 'PUBLICO'
                           GROUP  BY c.codcategoria)
                           FETCH first 1 ROWS only)
         WHEN c.dominio = 'PRIVADO' THEN
       ---- Privada ----
       (SELECT cat.nombrecategoria
        FROM   contenido c,
               categoria cat
        WHERE  c.dominio = 'PRIVADO'
               AND c.codcategoria = cat.codcategoria
        GROUP  BY c.codcategoria,
                  cat.nombrecategoria
        HAVING COUNT(*) = (SELECT Max(COUNT(*))
                           FROM   contenido c
                           WHERE  c.dominio = 'PRIVADO'
                           GROUP  BY c.codcategoria)
                           FETCH first 1 ROWS only)
       END AS NombreCategoria
FROM   contenido c,
       usuario u,
       categoria cat
WHERE  c.emailusuario = u.email
       AND c.codcategoria = cat.codcategoria
GROUP  BY u.nombre,
          c.dominio;