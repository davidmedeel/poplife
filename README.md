Descripción de github:

- Todo Aqui Funciona --- Ahora el tema es que funcione bien ...

Contenido:
Parte cliente.
Parte servidor.
extDB 3.
Archivo SQL para la creación de tablas.
Fixes de lo que ha roto Bohemia tras mil parches.

Que no incluye:
Addons.
Tutorial de cómo se monta un servidor.
Tutorial de cómo se monta la DB.
Servicio técnico.
Source de los dialogs.

¿Porqué?

Los buenos nunca ganan pero os voy a dar la oportunidad de poder empezar ese proyecto que teneis pensado partiendo de esta base, sin tener que empezar de 0.

Consejos:
Scripts Largos no --- es más rápido 10000 scripts de 300 líneas que un script de 10000 líneas. HyperThreading ... 

No usar cualquier (execVM) tipo de llamada en NSE o NS a archivos ... usar solo call compile PreprocessFileLineNumbers para funciones.

Si tienes que repetir varias veces una constante ... pre compilala:
#define CONSTANTE 2.5
_a = 1 + CONSTANTE;
diaglog _a; // esto es igual a 3.5 y 4 veces más rápido.

Arrays:
No hacer operaciones con arrays en el mismo array usando [] + [] o el comando set, usar siempre pushBack.
Para combinar arrays solo usa append... no inventes.
count _array  isEqualTo  []. No es coña .. pruebalo.

Condicionales:
No usar if () then {} else {} es preferible dos if () then {}.
Dejar la pereza y evitar al máximo los && o los OR || ... Es más eficiente hacer varios if () then {}.

Loops
Evitar usar el comando while {} o for ... do ... en cambio usar for "_i" from x to x do {}.
si no te da la cabeza o la lógica de tu script tiene por obligación que usar el while tendrá que ir al masterLoopHandler y en carga del HeadLessClient.

Puede parecer una gilipollez, pero a la hora de programar estamos constantemente **cagandola**, y la mejor forma de no cargarse el servidor entero es haciendo copias, pero claro, no vamos a estar copiando y pegando todo el rato, así que lo más útil es usar el github para hacer un control de versiones EFICAZ, en el que describa que es lo nuevo que hay en cada versión.

Si pasa cualquier error en el servidor, y no tenemos ni puta idea de lo que lo está provocando la mejor manera es volver para atrás (usando las versiones del github) y ir probando y descartando errores.
