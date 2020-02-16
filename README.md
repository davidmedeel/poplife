Descripción de github:

Puede parecer una gilipollez, pero a la hora de programar estamos constantemente **cagandola**, y la mejor forma de no cargarse el servidor entero es haciendo copias, pero claro, no vamos a estar copiando y pegando todo el rato, así que lo más útil es usar el github para hacer un control de versiones EFICAZ, en el que describa que es lo nuevo que hay en cada versión.

Si pasa cualquier error en el servidor, y no tenemos ni puta idea de lo que lo está provocando la mejor manera es volver para atrás (usando las versiones del github) y ir probando y descartando errores.


Uso del GitHub: 

---------------------------
Subir archivos al Git:
(Es recomendable hacer antes un git status para saber que es lo nuevo que vamos a agregar a la versión.)

git add .

Hacer comentarios para cada X:

git commit -am "mensaje para el commit" 

Subir al GIT:

git push origin master (o la version en la que se este actualizando, por ejemplo v0.0.3)

---------------------------

Control de Versiones:

(El v0.0.0 representa la version actual, bastante importante, y las "" el mensaje obviamente xD)

Git tag -a v0.0.0 -m ""

Subir los cambios al control de versión:

git push origin master --tags



**Descargar GIT a LOCAL
--

Descargar repositorio por primera vez:

git clone https://github.com/policeman18/pop2conEstilo

Actualizar repositorio una vez lo tengas ya:

Git pull (si da error: git pull urldelgithub master)

Sobreescribir cambios (de GIT a Local)
--

git fetch --all

git reset --hard origin/master


Recuperar Cambios:
--
 git stash show -p | git apply -R
 
# By Medel
