/*------------------------------------------------------------------------------   
                            CASOS DE PRUEBA 3
        Condiciones: mas antiguo/s & categoria lol & Dominio publico 
           & con al menos una visualizacion que no sea del creador.
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
--------------------------------------------------------------------------------
-- CASO: que sea de lol, privado, con visualizaciones - No aparece
INSERT INTO CONTENIDO VALUES ('19','Juego al LOL 0.1','01/04/2022','gonza@gmail.com','2','PRIVADO');
-- CASO: que sea de lol, privado, sin visualizaciones - No aparece
INSERT INTO CONTENIDO VALUES ('21','Juego al LOL V','06/04/2022','gonza@gmail.com','2','PRIVADO');
-- CASO: que seal lol, publico, con visualizaciones, fecha superior al minimo - No aparece
INSERT INTO CONTENIDO VALUES ('4','Top 5 Ganks','27/8/2022','manu@gmail.com','2','PUBLICO');
-- CASO: que sea de lol, publico, con visualizaciones Estos comparten todas las condiciones deberian aparecer ambos
INSERT INTO CONTENIDO VALUES ('15','Juego al LOL II','01/5/2022','gonza@gmail.com','2','PUBLICO');
INSERT INTO CONTENIDO VALUES ('16','Juego al LOL III','01/5/2022','gonza@gmail.com','2','PUBLICO');
-- CASO: que sea de lol, publico, sin visualizaciones - No aparece.
INSERT INTO CONTENIDO VALUES ('20','Juego al LOL VI','01/5/2022','manu@gmail.com','2','PUBLICO'); 
-- CASO: que no sea de lol, privado, con visualizaciones - No aparece.
INSERT INTO CONTENIDO VALUES ('2','Juego','29/8/2022','manu@gmail.com','1','PRIVADO');
-- CASO: que no sea de lol, privado, sin visualizaciones - No aparece.
INSERT INTO CONTENIDO VALUES ('22','Juego II','10/09/2022','manu@gmail.com','1','PRIVADO');
-- CASO: que no sea de lol, publico, con visualizaciones - No aparece.
INSERT INTO CONTENIDO VALUES ('8','Video','30/8/2022','facu@gmail.com','4','PUBLICO');
-- CASO: que no sea de lol, publico, sin visualizaciones - No aparece.
INSERT INTO CONTENIDO VALUES ('23','Video LOL','30/09/2022','facu@gmail.com','4','PUBLICO');
-- Visualizaciones
INSERT INTO VISUALIZACION values ('4', 'gonza@gmail.com', '01/1/2021');
INSERT INTO VISUALIZACION values ('4', 'clara@gmail.com', '01/1/2022');
INSERT INTO VISUALIZACION values ('5', 'gonza@gmail.com', '29/8/2022');
INSERT INTO VISUALIZACION values ('8', 'facu@gmail.com', '30/8/2022');
INSERT INTO VISUALIZACION values ('9', 'clara@gmail.com', '29/8/2022');
INSERT INTO VISUALIZACION values ('9', 'gonza@gmail.com', '15/5/2022');
INSERT INTO VISUALIZACION values ('10', 'manu@gmail.com', '30/5/2022');
INSERT INTO VISUALIZACION values ('11', 'gonza@gmail.com', '29/5/2022');
INSERT INTO VISUALIZACION values ('11', 'clara@gmail.com', '06/5/2022');
INSERT INTO VISUALIZACION values ('12', 'clara@gmail.com', '05/5/2022');
INSERT INTO VISUALIZACION values ('12', 'manu@gmail.com', '10/5/2022');
INSERT INTO VISUALIZACION values ('14', 'clara@gmail.com', '12/5/2022');
INSERT INTO VISUALIZACION values ('15', 'clara@gmail.com', '01/6/2022');
INSERT INTO VISUALIZACION values ('16', 'clara@gmail.com', '05/6/2022');
INSERT INTO VISUALIZACION values ('1', 'clara@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('4', 'clara@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('1', 'gonza@gmail.com', '01/9/2022');
INSERT INTO VISUALIZACION values ('2', 'gonza@gmail.com', '02/8/2022');
INSERT INTO VISUALIZACION values ('3', 'gonza@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('1', 'test@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('2', 'test@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('3', 'test@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('4', 'test@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('5', 'test@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('6', 'test@gmail.com', '06/8/2022');
INSERT INTO VISUALIZACION values ('1', 'test2@gmail.com', '03/8/2022');
INSERT INTO VISUALIZACION values ('2', 'test2@gmail.com', '04/8/2022');
INSERT INTO VISUALIZACION values ('3', 'test2@gmail.com', '05/8/2022');
INSERT INTO VISUALIZACION values ('19', 'test2@gmail.com', '05/8/2022');
INSERT INTO VISUALIZACION values ('4', 'test2@gmail.com', '06/8/2022');
INSERT INTO VISUALIZACION values ('5', 'test2@gmail.com', '07/8/2022');
INSERT INTO VISUALIZACION values ('6', 'test2@gmail.com', '08/8/2022');
--------------------------------------------------------------------------------