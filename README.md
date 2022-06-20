# ObligatorioBD1
## Integrantes
Ernesto Speranza - 198426 <br>
Alejandro Ortiz - 236783 <br>
Manuel Millán - 243431 <br>

## Álgebra relacional 
```
Ejercicio 1:
Cfort <- σ (codcategoria=1 &(fechaEmision>'30/04/2022' & fechaEmision<'01/06/2022')) (CONTENIDO)

Cm <- σ (codcategoria=4 &(fechaEmision>'30/04/2022' & fechaEmision<'01/06/2022')) (CONTENIDO)

UFort <- π(Email,Nickname)(Usuario * cfort)

Ucm <- π(Email,Nickname)(Usuario * Cm)

Resultado <- (UFort U Ucm) - (Ufort ∩Ucm)
```
```
Ejercicio 2:

Filtro<- σ (codcategoria=4 &(fechaEmision>'30/04/2022' & fechaEmision<'01/06/2022')&dominio='PRIVADO') (CONTENIDO)

Resultado <-π($5) (Visualizacion)|X|(Filtro) $2!= $7 & $1=$4
```
```
Ejercicio 3:

Filtro1<- σ((codcategoria=2) & (dominio = 'PUBLICO') & MINIMUN(fechaemision))(CONTENIDO)

ContenidoFiltrado <- π((emailusuario,Titulo)) Visualizacion|x|Filtro1 $1 = $4

ContenidoVisualizado <- π((emailusuario,Titulo)) (Usuario|X|visualización $1=$6)

ResultadoPreliminar <- ContenidoFiltrado ∩ ContenidoVisualizado

Resultado <- π((emailusuario,Titulo,nickname))(ResultadoPreliminar * Usuario)
```
```
Ejercicio 4 (TO FIX):

DF <- σ (fechacreacion>10/10/2021) (DONACION)

Email <- π email σ (Donacion |X| Usuario emailorigen = email & estadodonacion='PENDIENTE')

Donaron <- σ (Donación |X| Usuario emaildestino = email)

Resultado <- Email*Donaron*DF
```
## Cálculo relacional de tuplas
```
Ejercicio 5:
u.email, u.nickname | usuario (u) ^ (sysdate - u.fechanac)>=(18*365) ^

¬(∃ u, co) (categoria (c) ^ c.codCategoria = co.codCategoria ^

¬(∃ c) (contenido (co) ^ co.emailUsuario = u.email^ co.dominio = 'PUBLICO'))
```

## Consultas SQL
[Consultas SQL 1 - 10](Querys.sql)

## Casos de Prueba
### [Casos de prueba 3](/CasoDePrueba/CasoDePrueba3.sql)<br>
![](/Screenshots/CasoDePrueba3.png)<br>
### [Caso de prueba 5](/CasoDePrueba/CasoDePrueba5.sql)<br>
![](/Screenshots/CasoDePrueba5.png)<br>
### [Casos de prueba 8](/CasoDePrueba/CasoDePrueba8.sql)<br>
![](/Screenshots/CasoDePrueba8.png)<br>
### [Casos de prueba 10](/CasoDePrueba/CasoDePrueba10.sql)<br>
![](/Screenshots/CasoDePrueba10.png)<br>
### Sin Publico
![](/Screenshots/CasoDePrueba10_SinPublico.png)<br>
