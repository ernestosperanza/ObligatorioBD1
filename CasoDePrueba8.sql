/*------------------------------------------------------------------------------   
                            CASOS DE PRUEBA 8
        Condiciones: visualizar mayor cant contenido & abril 2022 & 
        no recibieron donaciones

        Comentario: Para los siguientes casos de prueba es necesario borrar
        las tablas y hacer los insert especificos para cada caso.
----------------------- USUARIOS & DONACIONES --------------------------------*/
INSERT INTO USUARIO values ('manu@gmail.com', 'manu', 'manu02m' ,'04/05/2002');
INSERT INTO USUARIO values ('facu@gmail.com', 'facu', 'facuf' ,'13/10/2002');
INSERT INTO USUARIO values ('clara@gmail.com', 'clara', 'claracur' ,'10/07/2001');
INSERT INTO USUARIO values ('gonza@gmail.com', 'gonza', 'gonzaM' ,'8/07/2005');
INSERT INTO USUARIO values ('fer@gmail.com','fer', 'fer12', '03/08/2000');
INSERT INTO USUARIO values ('juan@gmail.com','juan', 'juan_j', '04/08/2000');
INSERT INTO USUARIO values ('romi@gmail.com','romi', 'romx', '04/8/2000');
-- Categorias
INSERT INTO CATEGORIA VALUES ('1','Fortnite');
INSERT INTO CATEGORIA VALUES ('2','LoL');
INSERT INTO CATEGORIA VALUES ('3','Dota 2');
INSERT INTO CATEGORIA VALUES ('4','Musica');

-- Manu no recibio donaciones
INSERT INTO DONACION values ('manu@gmail.com', 'fer@gmail.com', '05/06/22', '10/06/22', '100','APROBADA');
INSERT INTO DONACION values ('manu@gmail.com', 'juan@gmail.com', '10/08/22', '10/09/22', '100','APROBADA');
INSERT INTO DONACION values ('manu@gmail.com', 'romi@gmail.com', '01/01/22', '13/02/22', '100','APROBADA');

INSERT INTO CONTENIDO VALUES ('3','Juego al fortnite','01/05/2022','gonza@gmail.com','1','PRIVADO');
INSERT INTO CONTENIDO VALUES ('4','Juego lol','29/8/2022','gonza@gmail.com','2','PRIVADO');
INSERT INTO CONTENIDO VALUES ('5','Juego dota 2','10/8/2022','gonza@gmail.com','3','PRIVADO');
INSERT INTO CONTENIDO VALUES ('6','Toco musica','05/10/2022','gonza@gmail.com','4','PRIVADO');


-- CASO: Manu no recibio donaciones, visualizo en abril 2022, visualizo mayor contenido - Aparece
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('4','manu@gmail.com','02/04/2022');
INSERT INTO VISUALIZACION values ('5','manu@gmail.com','03/04/2022');
INSERT INTO VISUALIZACION values ('6','manu@gmail.com','04/04/2022');

-- CASO: Manu no recibio donaciones, no visualizo en abril 2022, visualizo mayor contenido - No aparece 
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/05/2022');
INSERT INTO VISUALIZACION values ('4','manu@gmail.com','02/05/2022');
INSERT INTO VISUALIZACION values ('5','manu@gmail.com','03/05/2022');
INSERT INTO VISUALIZACION values ('6','manu@gmail.com','04/05/2022');


-- CASO: Manu no recibio donaciones, visualizo en abril 2022, no visualizo mayor contenido - No aparece Manu, aparece Facu
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('4','facu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('5','facu@gmail.com','01/04/2022');

-- CASO: Manu no recibio donaciones, no visualizo en abril 2022, no visualizo mayor contenido - No aparece Manu, aparece Facu
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/03/2022');
INSERT INTO VISUALIZACION values ('4','facu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('5','facu@gmail.com','01/04/2022');

-- CASO: Manu recibio donaciones, visualizo en abrill 2022, visualizo el mayor contenido - No aparece
INSERT INTO DONACION values ('fer@gmail.com', 'manu@gmail.com', '05/06/22', '10/06/22', '100','APROBADA');
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('4','manu@gmail.com','02/04/2022');
INSERT INTO VISUALIZACION values ('5','manu@gmail.com','03/04/2022');
INSERT INTO VISUALIZACION values ('6','manu@gmail.com','04/04/2022');

-- CASO: Manu recibio donaciones, no visualizo en abrill 2022, visualizo el mayor contenido - No aparece
INSERT INTO DONACION values ('fer@gmail.com', 'manu@gmail.com', '05/06/22', '10/06/22', '100','APROBADA');
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/05/2022');
INSERT INTO VISUALIZACION values ('4','manu@gmail.com','02/05/2022');
INSERT INTO VISUALIZACION values ('5','manu@gmail.com','03/05/2022');
INSERT INTO VISUALIZACION values ('6','manu@gmail.com','04/05/2022');

-- CASO: Manu recibio donaciones, visualizo en abril 2022, no visualizo el mayor contenido - No aparece Manu, aparece Facu
INSERT INTO DONACION values ('fer@gmail.com', 'manu@gmail.com', '05/06/22', '10/06/22', '100','APROBADA');
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('4','facu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('5','facu@gmail.com','01/04/2022');

-- CASO: Manu recibio donaciones, no visualizo en abril 2022, no visualizo el mayor contenido - No aparece Manu, aparece Facu
INSERT INTO DONACION values ('fer@gmail.com', 'manu@gmail.com', '05/06/22', '10/06/22', '100','APROBADA');
INSERT INTO VISUALIZACION values ('3','manu@gmail.com','01/05/2022');
INSERT INTO VISUALIZACION values ('4','facu@gmail.com','01/04/2022');
INSERT INTO VISUALIZACION values ('5','facu@gmail.com','01/04/2022');