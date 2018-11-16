# Obras y obreros
Debemos armar un modelo de obras en construcción, y los obreros que trabajan en ellas.


## Plantilla, consumo de materiales
En una obra trabajan obreros de distinto tipo. Consideramos cuatro tipos de obreros: _albañiles_, _plomeros_, _electricistas_ y _gasistas_.  
El modelo que construyamos debe registrar, y dar información sobre, la actividad que desarrollan los obreros en cada _jornada laboral_, o sea, en cada día en que se trabaja en la obra. 

Para llevar a cabo una obra, se requieren distintos materiales; en este modelo nos van a interesar los siguientes: ladrillos, caño, cable, cinta, fósforos y arandelas.
Para cada obra, se debe conocer en cada momento el _stock disponible_ de cada uno de estos materiales. 

Los obreros _consumen_ estos materiales para llevar a cabo sus tareas. Qué consumen, y cuánto, depende del tipo de obrero. En una jornada laboral se sabe que:
* un **albañil** consume 100 ladrillos.
* un **gasista** consume 3 metros de caño y 20 fósforos.
* un **plomero** consume 10 metros de caño y 30 arandelas.
* un **electricista** consume 4 metros de cable y un rollo de cinta aisladora.

(en las obras que modelamos, se usan los mismos cañnos para gas y para agua).

De cada obra hay que conocer la _plantilla_ de obreros que están asignados a la misma.
En cualquier momento se tiene que poder agregar o quitar a un obrero de la plantilla.   
A su vez, cada obrero puede estar de _licencia_ o no, debe registrarse cuando entra en licencia y cuando sale de licencia (o sea, vuelve al trabajo activo).  
Los **obreros disponibles** para una obra son los que están en su plantilla, y no están de licencia. 

<!---
Se deben considerar cuatro tipos de obreros: _albañiles_, _plomeros_, _electricistas_ y _gasistas_. En cada _jornada de trabajo_:
* un **albañil** _consume_ 100 ladrillos; su _aporte_ es levantar 3 metros cuadrados de pared.
* un **gasista** _consume_ 3 metros de caño y 20 fósforos, su _aporte_ es colocar 3 metros de caño de gas (es el caño que consumió).
* un **plomero** _consume_ 10 metros de caño y 30 arandelas, su _aporte_ es colocar 9 metros de caño de agua (son 9 de los 10 metros que consume; el resto es desperdicio).
* un **electricista** _consume_ 4 metros de cable y un rollo de cinta aisladora, su _aporte_ es colocar los 4 metros de cable.
--->
 
<br> 

**Requerimiento**  
Construir este modelo de forma tal que se pueda _registrar una jornada laboral_. 
En esta etapa, lo que hay que hacer es registrar el consumo de materiales de cada obrero disponible. En etapas posteriores, agregaremos más aspectos relacionados con cada jornada laboral.

P.ej. supongamos una obra que tiene entre sus materiales, 1000 ladrillos, 400 metros de caño, 8000 fósforos y 500 arandelas. Tiene cinco obreros en plantilla: dos albañiles, dos gasistas y un plomero. Uno de los albañiles está de licencia.

Después de registrar una jornada laboral deben quedar: 
* 900 ladrillos (se restan los 100 que consumió el albañil disponible), 
* 384 metros de caño (se restan los 6 de los dos gasistas más los 10 del plomero),
* 7960 fósforos (se restan 20 por cada uno de los dos gasistas), y
* 470 arandelas (se restan las 30 que consumió el plomero).

También se debe poder:
* registrar la recepción de una cantidad de ladrillos.
* lo mismo con cada tipo de material: metros de caño, fósforos, etc..
* poder preguntarle a una obra si tiene a un determinado obrero en la plantilla. 


<br>

## Registro de obras de un obrero 
Agregar a cada obrero una colección de las obras en las que trabajó. Al agregar un obrero a la plantilla de una obra, en ese mismo momento, hay que agregar la obra a la colección del obrero. 

<br> 

**Requerimiento**  

Poder preguntar si un obrero _pasó por una obra_, o sea, si está entre las obras en las que trabajó. P.ej. 
```
roque.pasoPor(obraCasaDeLucas)
```

<br>

## Errores
Agregar al modelo el manejo de estos errores:
* Si se pide registrar una jornada laboral de una obra que no tiene obreros disponibles, debe generarse un error con mensaje "No hay obreros disponibles para trabajar".
* Un obrero no puede quitarse de la plantilla de una obra mientras está de licencia. Si se intenta hacer esto, debe generarse un error con mensaje "Las leyes laborales están para respetarse - licencia implica estabilidad laboral". 

<br>

## Pago de jornales
Agregar al modelo la información necesaria para saber cuánto hay que pagarle a cada obrero en jornales adeudados, y para manejar el efectivo con que cuenta la obra.

Para esto, agregar en cada obrero, el dato de cuántos jornales se le adeudan. Este número debe aumentar en uno para cada jornada laboral que realice el obrero; esto hay que agregarlo al registro de una jornada laboral en una obra.

El importe de jornal de cada obrero se pacta con **UOCRA**, el sindicato de obreros de la construcción. Se establecen tres valores: uno para albañil, otro para especialista de baño y cocina (que incluye a gasistas y plomeros), otro para electricistas.
 
<br> 

**Requerimientos**  
* Poder preguntar, para un obrero, cuánto tiene para cobrar por jornales. Es el resultado de multiplicar la cantidad de jornales adeudados por el importe de jornal pactado con UOCRA.  
**Nota**: se incluye un objeto al que se le pueden preguntar los distintos 
* Poder preguntar el importe total que una obra adeuda en jornales a los obreros de su plantilla.
* Poder registrar el pago de jornales adeudados. Los efectos son: para cada obrero se cancelan los jornales adeudados, pasando a 0; el efectivo de la obra baja para reflejar el pago del importe total que adeuda la obra.
* Poder registrar que se agrega un importe al efectivo de una obra.  

Siguiendo con el ejemplo anterior, supongamos que el obrero que estaba de licencia vuelve al trabajo, que el plomero sale de licencia, y que luego se registra otra jornada laboral en la obra. Los importes de jornales pactados con UOCRA son, en este ejemplo: 2000 pesos para albañiles, 3000 para especialistas de baño y cocina, 3500 para electricistas. La obra tiene 100000 pesos en efectivo.

Después de las dos jornadas laborales: el albañil que trabajó dos días tiene 4000 pesos para cobrar por jornales; el otro albañil tiene 2000; los gasistas 6000 cada uno (ambos trabajaron dos días), el plomero 3000 pesos (trabajó un día) y el electricista 7000 pesos. La obra debe en jornales 22000 pesos (la suma de lo que tiene cada obrero para cobrar).  
Si se registra el pago de jornales adeudados, entonces el importe que tiene para cobrar cada obrero es de 0 pesos, y el dinero en efectivo de la obra baja a 78000 pesos.     
  

<br> 

## Avance de una obra, tipos de obras
Para que una obra se considere _finalizada_ deben cumplimentarse varios requisitos.
En este modelo simplificado contemplamos los siguientes:  
* construir 50 metros cuadrados de _pared_ por cada habitación, 
* colocar 10 _implementos de agua_ (tramo de caño, canilla, etc.) por cada baño.
* colocar 8 _implmentos de gas_ (tramo de caño, llave de paso, etc.) por cada baño, más 3 por cada habitación.
* colocar 50 metros por habitación, más 100 metros adicionales por piso, de _cables eléctricos_.

<br> 

Cada obrero _aporta_ al avance de la obra en la que trabaja, de acuerdo a qué tipo de obrero sea:
* un **albañil** levanta 3 metros cuadrados de pared por día.
* un **gasista** coloca un implemento de gas por día.
* un **plomero** coloca un implemento de agua cada dos días. Para simplificar, consideremos que coloca medio implemento por día.
* un **electricista** coloca 4 metros de cable eléctrico por día.


<br>

Hay dos tipos de obra: **casas** y **edificios**. 

Para una **casa** se informa: cantidad de habitaciones y cantidad de baños (que no se consideran habitaciones). Las casas son de un piso.

Para un **edificio** se informa: cantidad de pisos, cantidad de departamentos por piso, cantidad de habitaciones por departamento (en este modelo, se asume que todos los departamentos de un edificio tienen la misma cantidad de habitaciones), cantidad de ascensores. Para cada ascensor hay que considerar 300 metros adicionales de cable eléctrico. Se asume que cada departamento tiene exactamente un baño, ni más ni menos.

<br> 

**Requerimientos**    
* Agregar al registro de una jornada laboral, el _aporte_ que hace cada obrero. Para eso, cada obra debe llevar un acumulado de metros cuadrados construidos, e implementos de agua, implementos de gas y cables eléctricos colocados.
* Poder preguntar si una obra _está terminada_ o no. Está terminada si el acumulado de metros cuadrados construidos es mayor o igual al que corresponde a los requisitos, y lo mismo para implementos de gas, implmentos de agua, y cables eléctricos.

