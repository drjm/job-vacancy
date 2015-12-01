Documento Spike Heroku
======================

Introdución
----------------------

En este documento se detalla como hacer el deploy en heroku paso a paso, el tiempo aproximado que lleva el trabajo y resolución de algunos problemas, por otra parte esta guia esta diseñada solo para Job Vacancy, en otros desarrollos puede variar la forma en la que se ejecuta la migración de la base de datos.

Pasos
----------------------

1. Crearse un a cuenta en [Heroku](http://https://www.heroku.com/)
2. Logearse
3. Crear una app en heroku
  * Ir a Dashboard
  * Click en el "+" de arriba a la derecha
  * Seleccionar new app
4. Dar un nombre a la app y seleccionar una region, por defecto Estados Unidos debe funcionar.
5. Click en connect **GitHub** para integrar heroku con el repositorio
6. Seleccionar el usuario
   * Siempre toma el usuario que logea en heroku por lo que debe hacerlo el que posee la cuenta maestra de GitHub en el proyecto.
7. Colocan el nombre del proyecto, comienzan la busqueda.
8. Click en **connect** con el repo que se deseea integrar.
9. Ir a la seccion dashboard hacer click en el icono de 6 rectangulos arriba a la izquierda, desplegar el menú y seleccionar **Databases**.
  * Seleccionar **Create database**
  * Click en **Other plans:Dev Plan(Free)**
  * Click **Add Database**
  * Esperar un momento a que se cree la bases de datos.
  * Seleccionan la bases de datos para ver la info de la misma.
  * Click en **show** de la sección URL, se debe copiar esa dirección
10. Volver a heroku dashboard, y seleccionar la app creada en **Personal apps**.
11. Ir a **Settings**
12. Click en **Reveal Config Vars**, y colocan las siguientes variables
   | KEY                       | VALUE                  |
   |---------------------------|:----------------------:|
   | DATABASE_URL              | pegar direccion BD     | 
   | HEROKU_POSTGRESQL_PINK_URL| pegar direccion BD     |
   | LANG                      | en_US.UTF-8            |
   | RACK_ENV                  | production             |
13. Una vez terminado de colocar las variables de configuración, click en **Deploy**, y click en **Heroku git**
14. En la sección **Deploy using Heroku git**, click en **Heroku toolbelt**, se elige la plataforma y se siguien los pasos mencionados en la pagina.
15. Terminada la instalación de Heroku Toolbelt, volver a la pagina de heroku, y volver a la seccion de integración con GitHub.
16. Se loguean via consola a heroku (comando: **heroku login**).
17. Colocan el comando **heroku apps** para ver los nombres de las applicaciones activas.
18. Ejecutan el comando **heroku run rake db:migrate --app <nombreapp>**, para ejecutar la migración de la BD.
19. Terminada la migración, revisar que no tenga errores.
20. Volver a la pagina de heroku y seleccionar denuevo la aplicación de ser necesario.
21. Ir a **Deploy -> GitHub**, e ir a la ultima opción de esa sección llamada *Manual deploy*, seleccionan un branch y click en **deploy**.
22. Terminado el deploy, click en **View**, y podran ver la pagina y probarla, es recomendado guardarce la URL para futuros accesos.
   * Cada cambio que hagan a github, no va a afectar a su deploy, hasta que lo hagan manualmente. Para que lo haga automaticamente hay que activar el autodeploy en la misma sección.

####**Tiempo Estimado**####

*Tiempo Estimado del deploy, 3 horas pomodoro asumiendo inconvenientes*

####**Troubleshooting:**####

¿Me aparece un mensaje que la **aplicación a tenido un problema, reintente mas tarde**?

Este error se debe a una mala configuración de la integración de github, revisar si se selecciono bien el repositorio para hacer el deploy.

¿Veo la pagina pero cuando me quiero loguear o ver las ofertas me aparece **Internal server error**?

Este error es debido a una mala configuración con la base de datos, una mala migración o una ruta mal puesta en las variables de configuración.

