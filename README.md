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

## Pago de jornales
Agregar al modelo la información necesaria para saber cuánto hay que pagarle a cada obrero en jornales adeudados, y para manejar el efectivo con que cuenta la obra.

Para esto, agregar en cada obrero, el dato de cuántos jornales se le adeudan. Este número debe aumentar en uno para cada jornada laboral que realice el obrero; esto hay que agregarlo al registro de una jornada laboral en una obra.

El importe de jornal de cada obrero se pacta con **UOCRA**, el sindicato de obreros de la construcción. Se establecen tres valores: uno para albañil, otro para especialista de baño y cocina (que incluye a gasistas y plomeros), otro para electricistas.
 
<br> 

**Requerimientos**  
* Poder preguntar, para un obrero, cuánto tiene para cobrar por jornales. Es el resultado de multiplicar la cantidad de jornales adeudados por el importe de jornal pactado con UOCRA.
* Poder preguntar el importe total que una obra adeuda en jornales a los obreros de su plantilla.
* Poder registrar el pago de jornales adeudados. Los efectos son: para cada obrero se cancelan los jornales adeudados, pasando a 0; el efectivo de la obra baja para reflejar el pago del importe total que adeuda la obra.
* Poder registrar que se agrega un importe al efectivo de una obra.  

Siguiendo con el ejemplo anterior, supongamos que el obrero que estaba de licencia vuelve al trabajo, que el plomero sale de licencia, y que luego se registra otra jornada laboral en la obra. Los importes de jornales pactados con UOCRA son, en este ejemplo: 2000 pesos para albañiles, 3000 para especialistas de baño y cocina, 3500 para electricistas. La obra tiene 100000 pesos en efectivo.

Después de las dos jornadas laborales: el albañil que trabajó dos días tiene 4000 pesos para cobrar por jornales; el otro albañil tiene 2000; los gasistas 6000 cada uno (ambos trabajaron dos días), el plomero 3000 pesos (trabajó un día) y el electricista 7000 pesos. La obra debe en jornales 22000 pesos (la suma de lo que tiene cada obrero para cobrar).  
Si se registra el pago de jornales adeudados, entonces el importe que tiene para cobrar cada obrero es de 0 pesos, y el dinero en efectivo de la obra baja a 78000 pesos.     
  

<br>

## Errores
Agregar al modelo el manejo de estos errores:
* Si se pide registrar una jornada laboral de una obra que no tiene obreros disponibles, debe generarse un error con mensaje "No hay obreros disponibles para trabajar".
* Un obrero no puede quitarse de la plantilla de una obra mientras está de licencia. Si se intenta hacer esto, debe generarse un error con mensaje "Las leyes laborales están para respetarse - licencia implica estabilidad laboral". 

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

## Avance de una obra, tipos de obras
Para que una obra se considere _finalizada_ deben cumplimentarse varios requisitos.
En este modelo simplificado contemplamos los siguientes:  
* construir 50 metros cuadrados de _pared_ por cada habitación, 
* colocar la cantidad de _caños de gas_ que resultan de esta cuenta: `(ancho + profundidad) * cantidad de pisos * 5 metros`.
* colocar 180 metros de _caños de agua_ por cada baño.
* colocar 50 metros por habitación, más 100 metros adicionales por piso, de _cables_.

<br> 

Hay dos tipos de obra: **casas** y **edificios**. Para ambos se informa ancho y profundidad del terreno. 

Para una **casa** se informa también: cantidad de habitaciones, cantidad de baños (que no se consideran habitaciones), cantidad de pisos.

Para un **edificio** se informa: cantidad de pisos, cantidad de departamentos por piso, cantidad de habitaciones por departamento, cantidad de ascensores. Para cada ascensor hay que considerar 300 metros adicionales de cable. Se asume que cada departamento tiene exactamente un baño, ni más ni menos.

<br> 

**Requerimientos**    
* Agregar al registro de una jornada laboral, el _aporte_ que hace cada obrero. Para eso, cada obra debe llevar un acumulado de metros cuadrados construidos, y metros de caños de gas, caños de agua y cables colocados.
* Poder preguntar si una obra _está terminada_ o no. Está terminada si el acumulado de metros cuadrados construidos supera al que corresponde a los requisitos, y lo mismo para caños de gas, caños de agua y cables.

<!---
Las obras tienen: 
* un conjunto de obreros que se registran para trabajar;
* una cantidad de metros de superficie a construir;

Además, no se pueden iniciar si no fueron habilitadas municipalmente, y no se pueden finalizar si no se completaron todas las tareas necesarias.

Mas allá del tipo de obra, cada obra al inicio define un presupuesto en pesos y una cantidad de materiales a consumir: _ladrillos_, _cables_ (en metros), _cañosDeAgua_ (en metros), _cañosDeGas_ (en metros).
Cada trabajador informa a la obra de su trabajo realizado y esta actualiza su avance.
La obra tiene que poder informar si está finalizada, esto sucede cuando se terminaron de utilizar todos los materiales.

Se calcula que por m2 de superficie a construir se necesitan:

- 500 ladrillos, 5 metros de caños de agua, 2 metros de caños de gas y 8 metros de cables.

Al inicio de una jornal, verifica si faltan materiales por consumir y llama a los obreros registrados para que trabajen la jornada de trabajo. Cuando el obrero finaliza su jornada, debe avisarle a la obra del avance. Lo consumido por cada obrero fue especificado en el apartado anterior.

Tenemos dos tipos de obras:
### casas
Pueden ser construcciones de hasta 3 pisos, deben poder definirse la cantidad de habitaciones, baños y lugares comunes.
Si la casa tiene más de una planta, debe sumar un 20% de cada material por planta.
Si tiene cochera, sumar otro 10% a cada material.

### edificios
Tienen 4 pisos o más, ademas se tiene que poder definir cuántos departamentos hay por piso.
Los edificios además tienen que indicar la cantidad de ascensores, por ascensor se calcula 3000 metros de _cable_.
Un edificio puede tener cochera subterránea de varios niveles. Por cada nivel se agregan:

- 5000 ladrillos, 100 metros de caños de agua y 200 metros de cables.


# Liquidacion de sueldos y Sindicatos
Las obras liquidan el sueldo quincenalmente a todos los obreros, consultando a cada obreros cuando se le debe liquidar.

Los obreros saben cuantos jornales tienen pendientes de cobrar. El precio por jornal está definido por el sindicado (UOCRA). Los obreros deben guardar un registro de los días trabajados en la última quincena.
Además deben guardar un registro de las obras en las que trabajó

Los _sindicatos_ tienen una nomina de empleados registrados. Tambien saben el precio por jornal de los albaniles, el precio por ahora de cada especialidad:

_albañil_ : 300
_plomero_ : 800
_electricista_ : 1000
_gasista_ : 1300

## UOCRA Presente
Cada el sindicato visita la obra para verificar que todos los obreros esten en blanco y todos esten usando los elementos de seguridad correspondientes.

Para evitar suspensiones la obra toma algunas medidas:

- cuando un obrero se registra para trabajar en una obra, se verifica con el sindicato que el obrero en cuestion esté en sus registros.

- antes del inicio de la jornada laboral, se verifica que cada obrero esté utilizando los elementos de seguridad. Esta verificación se realiza preguntandole al obrero.

- Cada obra debe poder _informar_ la nómina de obreros trabajando en ella su número de afiliado a UOCRA.

## Enfermedad
Un obrero puede declarse enfermo, en esos casos no debe ser llamado a trabajar.
--->