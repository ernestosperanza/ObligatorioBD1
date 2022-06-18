/*------------------------------------------------------------------------------   
                            CASOS DE PRUEBA 10
------------------------------------------------------------------------------*/
-- Usuarios: GLOBALES
INSERT INTO USUARIO values ('manu@gmail.com', 'manu', 'manu02m' ,'04/05/2002');
INSERT INTO USUARIO values ('facu@gmail.com', 'facu', 'facuf' ,'13/10/2002');
INSERT INTO USUARIO values ('clara@gmail.com', 'clara', 'claracur' ,'10/07/2001');
INSERT INTO USUARIO values ('gonza@gmail.com', 'gonza', 'gonzaM' ,'8/07/2005');
INSERT INTO USUARIO values ('test@gmail.com','test', 'testUser1', '03/8/2000');
INSERT INTO USUARIO values ('test2@gmail.com','test2', 'testUser2', '04/8/2000');

-- Categoria: GLOBALES
INSERT INTO CATEGORIA VALUES ('1','Fortnite');
INSERT INTO CATEGORIA VALUES ('2','LoL');
INSERT INTO CATEGORIA VALUES ('3','Dota 2');
INSERT INTO CATEGORIA VALUES ('4','Musica');

-- Contenido
INSERT INTO CONTENIDO VALUES ('1','Juego al LOL','01/5/2022','gonza@gmail.com','2','PRIVADO');
INSERT INTO CONTENIDO VALUES ('2','Juego','29/8/2022','manu@gmail.com','1','PRIVADO');
INSERT INTO CONTENIDO VALUES ('3','Juego','29/8/2022','manu@gmail.com','4','PRIVADO');
INSERT INTO CONTENIDO VALUES ('4','Top 5 Ganks','27/8/2022','manu@gmail.com','2','PUBLICO');
INSERT INTO CONTENIDO VALUES ('5','Juego','29/8/2022','gonza@gmail.com','1','PRIVADO');
INSERT INTO CONTENIDO VALUES ('6','Foto','19/5/2020','facu@gmail.com','3','PUBLICO');
INSERT INTO CONTENIDO VALUES ('7','Video','30/8/2022','facu@gmail.com','1','PUBLICO');
INSERT INTO CONTENIDO VALUES ('8','Video','30/8/2022','facu@gmail.com','4','PUBLICO');
INSERT INTO CONTENIDO VALUES ('9','Juego','29/8/2022','clara@gmail.com','4','PUBLICO');
INSERT INTO CONTENIDO VALUES ('10','Juego','26/5/2022','manu@gmail.com','4','PRIVADO');
INSERT INTO CONTENIDO VALUES ('11','Juego','26/5/2022','gonza@gmail.com','4','PRIVADO');
INSERT INTO CONTENIDO VALUES ('12','Musica','9/5/2022','facu@gmail.com','1','PUBLICO');
INSERT INTO CONTENIDO VALUES ('13','Video','10/5/2022','manu@gmail.com','1','PUBLICO');
INSERT INTO CONTENIDO VALUES ('14','Musica','9/5/2022','facu@gmail.com','4','PRIVADO');
INSERT INTO CONTENIDO VALUES ('15','Juego al LOL II','01/5/2022','gonza@gmail.com','2','PUBLICO');
INSERT INTO CONTENIDO VALUES ('16','Juego al LOL III','01/5/2022','gonza@gmail.com','2','PUBLICO');

INSERT INTO CONTENIDO VALUES ('17','Juego','27/5/2022','manu@gmail.com','3','PUBLICO');
INSERT INTO CONTENIDO VALUES ('18','Juego','28/5/2022','manu@gmail.com','4','PUBLICO');

-- Visualizacion
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
INSERT INTO VISUALIZACION values ('4', 'test2@gmail.com', '06/8/2022');
INSERT INTO VISUALIZACION values ('5', 'test2@gmail.com', '07/8/2022');
INSERT INTO VISUALIZACION values ('6', 'test2@gmail.com', '08/8/2022');

-- Donaciones
-- emailOrigen, emailDestino, fechaCreacion, FechaAcreditacion, Monto, estadoDonacion
INSERT INTO DONACION values ('clara@gmail.com', 'facu@gmail.com', '05/6/2022','10/6/2022',100,'APROBADA');
INSERT INTO Donacion values ('clara@gmail.com', 'manu@gmail.com', '05/6/2022','10/6/2022',150,'APROBADA');
INSERT INTO Donacion values ('clara@gmail.com', 'gonza@gmail.com', '05/6/2022','10/6/2022',200,'APROBADA');
INSERT INTO Donacion values ('gonza@gmail.com', 'facu@gmail.com', '05/6/2022','10/6/2022',100,'APROBADA');
INSERT INTO Donacion values ('gonza@gmail.com', 'clara@gmail.com', '05/6/2022','10/6/2022',300,'APROBADA');
INSERT INTO DONACION values ('clara@gmail.com', 'facu@gmail.com', '10/9/2021','',100,'PENDIENTE');
INSERT INTO Donacion values ('gonza@gmail.com', 'manu@gmail.com', '05/6/2022','',500,'PENDIENTE');
INSERT INTO Donacion values ('manu@gmail.com', 'facu@gmail.com', '05/6/2022','',150,'PENDIENTE');
INSERT INTO Donacion values ('manu@gmail.com', 'clara@gmail.com', '05/6/2022','',200,'PENDIENTE');
INSERT INTO Donacion values ('manu@gmail.com', 'gonza@gmail.com', '05/6/2022','',50,'PENDIENTE');
INSERT INTO Donacion values ('facu@gmail.com', 'manu@gmail.com', '05/6/2022','',150,'PENDIENTE');
INSERT INTO Donacion values ('facu@gmail.com', 'clara@gmail.com', '05/6/2022','',200,'PENDIENTE');