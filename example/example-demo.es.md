# Una demo del tiempo de ejecución políglota de Cloud Foundry

El propósito de este módulo es mostrar varios microservicios implementados en diferentes idiomas que se ejecutan en cloud Foundry. Uno de los beneficios de los microservicios es el poder de elección. Si eres un geek de java, usa java, python ... oye, ¡kotlin aún mejor! Use lo que usted y su equipo se sientan cómodos con. La cosa es ... cuanto más varíe, más difícil se vuelve operacionalizar, pero esas cosas no tienen por qué afectarnos en el siglo XXI. Ingrese a Cloud Foundry ... ayuda a que el desarrollador elija y mantenga la cordura operativa ... y la cordura es importante.

Esta demostración proporciona una API frente a los siguientes microservicios que construiremos y enviaremos a Cloud Foundry.

* Howdy-akka
* Howdy-boot
* Howdy-kotlin
* Howdy-nodejs
* Howdy-python

## Requisitos

* El acceso a una implementación de Cloud Foundry, [PWS] (https://run.pivotal.io) es bueno o [PCF Dev] (https://pivotal.io/pcf-dev)
* Descargue e instale [cf-cli] (https://pivotal.io/platform/pcf-tutorials/getting-started-with-pivotal-cloud-foundry/install-the-cf-cli)
* Descargue e instale [HTTPie] (https://httpie.org/) que se usa a continuación como 'http'

### Inicie sesión en Cloud Foundry (se muestran las pws)

* `` cf login -a api.run.pivotal.io``

## Requisitos

## Construye y presiona proyectos

1. Abra un terminal y clone el taller de demostración github repo: <https://github.com/Pivotal-Field-Engineering/pace-cnd-java>

1. Cambie a la carpeta "plataforma nativa en la nube"

`` `
    cd ./cloud-native-platform
`` `

### Construye y presiona howdy-akka

* `` cd howdy-akka``
* `` sbt assembly``
* `` cf push``
* Grabar el punto final

### Construye y presiona howdy-boot

* `` cd howdy-boot``
* `` mvnw clean package``
* `` cf push``
* Grabar el punto final

### Construye y presiona howdy-kotlin

* `` cd howdy-kotlin``
* `` mvnw clean package``
* `` cf push``
* Grabar el punto final

### Construye y presiona howdy-nodejs

* `` cd howdy-nodejs``
* `` cf push``
* Grabar el punto final

### Construye y presiona howdy-python

* `` cd howdy-python``
* `` cf push``
* Grabar el punto final

### Construye y presiona howdy-proxy

* `` cd howdy-proxy``
* `` mvnw clean package``
* Agregue los puntos finales en manifest.yml
  * Reemplace `` <howdy-boot-endpoint-here> `` con el punto final de howdy-boot que guardó desde arriba.
  * Reemplace `` <howdy-kotlin-endpoint-here> `` con el punto final de howdy-kotlin que guardó desde arriba.
  * Reemplace `` <howdy-akka-endpoint-here> `` con el punto final howdy-akka que guardó desde arriba.
  * Reemplace `` <howdy-nodejs-endpoint-here> `` con el punto final de howdy-nodejs que guardó desde arriba.
  * Reemplace `` <howdy-python-endpoint-here> `` con el punto final de howdy-python que guardó desde arriba.
* `` cf push``
* Registre el punto final de proxy porque lo usaremos a continuación para probar las llamadas a la API

## Prueba api (s)

```
http <proxy-end-point> / akka / users
http <proxy-end-point> / springboot / names
http <proxy-end-point> / nodejs / howdy
http <proxy-end-point> / kotlin / address
http <proxy-end-point> / python / int
```