/*------------------------------------------------------------------------------
 EJ1: Obtener el email y nickname de aquellos usuarios que emitieron contenido 
 de las categorías Música o Fortnite, pero no ambas. Considerar solo 
 contenidos de mayo de 2022.
------------------------------------------------------------------------------*/
SELECT con.emailusuario,
       u.nickname
FROM   contenido con,
       usuario u
WHERE  con.emailusuario = u.email
       AND con.codcategoria = (SELECT cat.codcategoria
                               FROM   categoria cat
                               WHERE  cat.nombrecategoria = 'Fortnite')
       AND Extract (month FROM con.fechaemision) = 5
UNION
SELECT con.emailusuario,
       u.nickname
FROM   contenido con,
       usuario u
WHERE  con.emailusuario = u.email
       AND con.codcategoria = (SELECT cat.codcategoria
                               FROM   categoria cat
                               WHERE  cat.nombrecategoria = 'Musica')
       AND Extract (month FROM con.fechaemision) = 5
MINUS
(SELECT con.emailusuario,
        u.nickname
 FROM   contenido con,
        usuario u
 WHERE  con.emailusuario = u.email
        AND con.codcategoria = (SELECT cat.codcategoria
                                FROM   categoria cat
                                WHERE  cat.nombrecategoria = 'Fortnite')
        AND Extract (month FROM con.fechaemision) = 5)
INTERSECT
SELECT con.emailusuario,
       u.nickname
FROM   contenido con,
       usuario u
WHERE  con.emailusuario = u.email
       AND con.codcategoria = (SELECT cat.codcategoria
                               FROM   categoria cat
                               WHERE  cat.nombrecategoria = 'Musica')
       AND Extract (month FROM con.fechaemision) = 5; 
/*------------------------------------------------------------------------------
 EJ2: Obtener el título de los contenidos de la categoría "Música" que tuvieron 
 visualizaciones de otros usuarios distintos al creador, en el mes de mayo 
 de 2022, y cuyo dominio sea Privado.
------------------------------------------------------------------------------*/
SELECT c.titulo
FROM   visualizacion v
       inner join contenido c
               ON v.codcontenido = c.codcontenido
WHERE  c.dominio = 'PRIVADO'
       AND Extract (month FROM c.fechaemision) = 5
       AND c.codcategoria = '4'
       AND c.emailusuario != v.emailusuario; 
/*------------------------------------------------------------------------------
 EJ3: Obtener el o los contenidos más antiguos de la categoría LoL. Para cada  
 uno mostrar su título y el email y nickname del usuario creador.             
 Considerar solo contenidos de dominio público y que hayan sido visualizados  
 al menos una vez.                                                  
------------------------------------------------------------------------------*/
SELECT DISTINCT c.titulo,
                c.emailusuario,
                u.nickname
FROM   usuario u
       inner join contenido c
               ON u.email = c.emailusuario
       inner join visualizacion v
               ON v.codcontenido = c.codcontenido
WHERE  c.codcategoria = '2'
       AND c.dominio = 'PUBLICO'
       AND c.fechaemision = (SELECT Min(c.fechaemision)
                             FROM   contenido c
                             WHERE  c.codcategoria = '2'
                                    AND c.dominio = 'PUBLICO');
/*------------------------------------------------------------------------------
 EJ4: Mostrar los nicknames de los usuarios que hayan recibido más de una 
 donación cuyo estado sea pendiente y que a su vez hayan donado a más de un 
 usuario.Considerar las donaciones posteriores al 10/10/2021.
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
------------------------------------------------------------------------------*/
SELECT u.email,
       u.nickname
FROM   usuario u
WHERE  Trunc(SYSDATE - fechanac) > '6570' --18*365=6570
       AND u.email IN (SELECT emailusuario
                       FROM   contenido
                       WHERE  dominio = 'PUBLICO'
                       GROUP  BY emailusuario
                       HAVING Count(DISTINCT codcategoria) =
                              -- Cuento el total de las categorias
                              (SELECT SUM(Count(DISTINCT codcategoria))
                               FROM   contenido c1
                               GROUP  BY codcategoria)); 
/*------------------------------------------------------------------------------
 EJ6: Proveer una consulta que muestre los siguientes datos de las donaciones: 
 EmailOrigen,EmailDestino, Fecha y EstadoDonación. Para las donaciones 
 aprobadas mostrar la fecha y para las pendientes mostrar el texto 
 “Transacción programada”. Considerar aquellos usuarios cuyo nickname tenga por 
 lo menos 5 letras de longitud.
------------------------------------------------------------------------------*/
SELECT emailorigen as EmailOrigen, emaildestino as EmailDestino, 
CASE WHEN fechaacreditacion is  NULL THEN 'Transaccion programada'
ELSE TO_CHAR(fechaacreditacion, 'DD/MM/YY')
END as Fecha, estadodonacion as EstadoDonacion
FROM donacion d, usuario u
WHERE u.email = d.emailorigen AND u.nickname IN (SELECT nickname
                                                FROM usuario
                                                WHERE LENGTH(nickname) >= 5);
/*------------------------------------------------------------------------------
 EJ7: Obtener para cada usuario la cantidad de contenidos de dominio público 
 y privado que emitió. Considerar solamente los contenidos emitidos en la 
 primera quincena de marzo de 2022.
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
------------------------------------------------------------------------------*/
SELECT u.nombre   AS Nombre,
       u.fechanac AS FechaNac
FROM   usuario u
WHERE  u.email IN (SELECT DISTINCT v.emailusuario
                   FROM   visualizacion v
                   WHERE  v.emailusuario IN (SELECT emailusuario
                                             FROM   visualizacion
                                             GROUP  BY emailusuario
                                             -- Busca el maximo de visualizaciones 
                                             -- de los que no tienen donaciones
                                             HAVING
                          Count(*) = (SELECT Max(Count(*))
                                      FROM   visualizacion
                                      WHERE
                          emailusuario NOT IN
                          -- Lista de los que recibieron donaciones
                          (SELECT DISTINCT emaildestino
                           FROM   donacion)
                          -- Abril de 2022 || AGREGAR QUE FILTRE POR Anio
                          AND Extract (month FROM fecha) = 4
                                      GROUP  BY emailusuario))); 
/*------------------------------------------------------------------------------
 EJ9: Obtener el nombre de la categoría para la cual se haya emitido la menor 
 cantidad de contenido y que alguno de esos contenidos haya tenido la mayor 
 cantidad de visualizaciones. Considerar solamente contenidos públicos 
 y que se hayan subido hace 15 días.
------------------------------------------------------------------------------*/


/*------------------------------------------------------------------------------
 EJ10: Obtener para cada dominio (Público y Privado): los usuarios que han 
 emitido contenido con dicho dominio y la cantidad total de emisiones por 
 usuario para ese dominio. Obtener el porcentaje que representan estas 
 cantidades sobre el total de contenidos emitidos para cada dominio. 
 Además, obtener el nombre de la categoría que obtuvo la mayor cantidad de 
 visualizaciones para cada dominio de contenido
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
                                             WHERE dominio = 'PUBLICO') * 100)), '%') 
         WHEN c.dominio = 'PRIVADO' THEN 
            CONCAT(to_char(round(COUNT(*) / (SELECT COUNT( *) 
                                             FROM contenido WHERE dominio = 'PRIVADO') * 100)), '%') 
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
       END       AS NombreCategoria
FROM   contenido c,
       usuario u,
       categoria cat
WHERE  c.emailusuario = u.email
       AND c.codcategoria = cat.codcategoria
GROUP  BY u.nombre,
          c.dominio;