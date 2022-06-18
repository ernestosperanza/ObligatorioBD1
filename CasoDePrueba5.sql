/*------------------------------------------------------------------------------   
                            CASOS DE PRUEBA 5
        Condiciones: mayor a 18 & contenido de todas las categorias & Dominio publico 
------------------------------------------------------------------------------*/
-----------    Usuarios y categorias para el caso de prueba   ------------------
INSERT INTO USUARIO values ('manu@gmail.com', 'manu', 'manu02m' ,'04/05/2002');
INSERT INTO USUARIO values ('facu@gmail.com', 'facu', 'facuf' ,'13/10/2002');
INSERT INTO USUARIO values ('clara@gmail.com', 'clara', 'claracur' ,'10/07/2001');
INSERT INTO USUARIO values ('gonza@gmail.com', 'gonza', 'gonzaM' ,'8/07/2005');
INSERT INTO USUARIO values ('test@gmail.com','test', 'testUser1', '03/8/2000');
INSERT INTO USUARIO values ('test2@gmail.com','test2', 'testUser2', '04/8/2000');
INSERT INTO CATEGORIA VALUES ('1','Fortnite');
INSERT INTO CATEGORIA VALUES ('2','LoL');
INSERT INTO CATEGORIA VALUES ('3','Dota 2');
INSERT INTO CATEGORIA VALUES ('4','Musica');

-- CASO: usuario menor a 18 dominio privado, emite contenido 2 - No aparece
INSERT INTO CONTENIDO VALUES('18','Juego al Lol', '13/09/22','gonza@gmail.com','2','PRIVADO');
-- CASO: usuario menor a 18 dominio privado, emite contenido 1 - No aparece
INSERT INTO CONTENIDO VALUES('19','Juego al Fortnite', '13/09/22','gonza@gmail.com','1','PRIVADO');
-- CASO: usuario menor a 18, dominio privado, emite contenido 3 - No aparece
INSERT INTO CONTENIDO VALUES('20','Juego al Dota 2', '13/09/22','gonza@gmail.com','3','PRIVADO');
-- CASO: usuario menor a 18, dominio privado, emite contenido 4 - No aparece
INSERT INTO CONTENIDO VALUES('21','Escucho musica', '13/09/22','gonza@gmail.com','4','PRIVADO');
-- CASO: usuario menor a 
-- Emitio de todas, no es mayor a 18 y no tiene dominio publico

-- CASO: usuario menor a 18, dominio publico, emite contenido 2 - No aparece
INSERT INTO CONTENIDO VALUES('22','Juego al Lol', '13/09/22','gonza@gmail.com','2','PUBLICO');
-- CASO: usuario menor a 18, dominio publico, emite contenido 1 - No aparece
INSERT INTO CONTENIDO VALUES('23','Juego al Fortnite', '13/09/22','gonza@gmail.com','1','PUBLICO');
-- CASO: usuario menor a 18, domino publico, emite contenido 3 - No aparece
INSERT INTO CONTENIDO VALUES('24','Juego al Dota 2', '13/09/22','gonza@gmail.com','3','PUBLICO');
-- CASO: usuario menor a 18, dominio publico, emite contenido 4 - No aparece
INSERT INTO CONTENIDO VALUES('25','Escucho musica', '13/09/22','gonza@gmail.com','4','PUBLICO');
--Emitio de todas, tiene dominio publico pero no es mayor a 18

-- CASO: usuario mayor a 18, dominio publico, emite contenido 2 - No aparece
INSERT INTO CONTENIDO VALUES('26','Juego al Lol', '13/09/22','manu@gmail.com','2','PUBLICO');
-- CASO: usuario mayor a 18, dominio publico, emite contenido 1 - No aparece
INSERT INTO CONTENIDO VALUES('31','Juego al Fortnite', '13/09/22','manu@gmail.com','1','PUBLICO');
-- CASO: usuario mayor a 18, dominio publico, emite contenido 3 - No aparece
INSERT INTO CONTENIDO VALUES('30','Juego dota 2', '13/09/22','manu@gmail.com','3','PUBLICO');
-- CASO. usuario mayor a 18, dominio publico, emite contenido 4 - Aparece
INSERT INTO CONTENIDO VALUES('29','Escucho musica', '13/09/22','manu@gmail.com','4','PUBLICO');
--Emitio de todas las categorias, es mayor a 18 y tiene dominio publico

-- CASO: usuario mayor a 18, dominio privado, emite contenido 2 - No aparece
INSERT INTO CONTENIDO VALUES('33','Juego al Lol', '13/09/22','clara@gmail.com','2','PRIVADO');
-- CASO: usuario mayor a 18, dominio privado, emite contenido 1 - No aparece
INSERT INTO CONTENIDO VALUES('34','Juego al Fortnite', '13/09/22','clara@gmail.com','1','PRIVADO');
-- CASO: usuario mayor a 18, dominio privado, emite contenido 3 - No aparece
INSERT INTO CONTENIDO VALUES('36','Juego dota 2', '13/09/22','clara@gmail.com','3','PRIVADO');
-- CASO: usuario mayor a 18, dominio privado, emite contenido 4 - No aparece
INSERT INTO CONTENIDO VALUES('38','Escucho musica', '13/09/22','clara@gmail.com','4','PRIVADO');
--Emitio de todas, es mayor pero el dominio no es publico