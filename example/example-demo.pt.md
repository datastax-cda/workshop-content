# Uma demonstração do tempo de execução poliglota do Cloud Foundry

O objetivo deste módulo é fazer frente a vários microservices implementados em diferentes linguagens em execução na fundição em nuvem. Um dos benefícios dos microsserviços é o poder de escolha. Se você é um geek de java, então use java, python ... ei, kotlin ainda melhor! Use o que você e sua equipe estão confortáveis. A coisa é ... quanto mais você varia, mais difícil se torna operacionalizar, mas essas coisas não precisam nos atormentar no século XXI. Entre no Cloud Foundry ... ele ajuda a fornecer a escolha do desenvolvedor, mas mantém a sanidade operacional ... e a sanidade é importante.

Esta demonstração fornece uma interface da API para os seguintes microsserviços, os quais criaremos e enviaremos ao Cloud Foundry.

* howdy-akka
* howdy-boot
* howdy-kotlin
* howdy-nodejs
* howdy-python

## Requisitos

* Acesso a uma implantação do Cloud Foundry, [PWS] (https://run.pivotal.io) é legal ou [PCF Dev] (https://pivotal.io/pcf-dev)
* Faça o download e instale [cf-cli] (https://pivotal.io/platform/pcf-tutorials/getting-started-with-pivotal-cloud-foundry/install-the-cf-cli)
* Faça o download e instale o [HTTPie] (https://httpie.org/), que é usado abaixo como 'http'

### Login na Cloud Foundry (pws mostrados)

* `` cf login -a api.run.pivotal.io``

## Requisitos

## Construir e enviar projetos

1. Abra um terminal e clone o repositório do github do demo da oficina: <https://github.com/Pivotal-Field-Engineering/pace-cnd-java>

1. Mude para a pasta "cloud-native-platform"

`` `
    cd ./cloud-native-platform
`` `

### Construir e empurrar howdy-akka

* `` cd howdy-akka``
* `` sbt assembly``
* `` cf push``
* Registre o ponto final

### Construir e Empurrar howdy-boot

* `` cd howdy-boot``
* `` mvnw clean package``
* `` cf push``
* Registre o ponto final

### Construir e Empurrar howdy-kotlin

* `` cd howdy-kotlin``
* `` mvnw clean package``
* `` cf push``
* Registre o ponto final

### Build and Push howdy-nodejs

* `` cd howdy-nodejs``
* `` cf push``
* Registre o ponto final

### Construir e enviar o howdy-python

* `` cd howdy-python``
* `` cf push``
* Registre o ponto final

### Construir e enviar o proxy do howdy

* `` cd howdy-proxy``
* `` mvnw clean package``
* Adicione o (s) ponto (s) final (es) no manifest.yml
  Substitua `` <howdy-boot-endpoint-here> `` com o ponto final do howdy-boot que você salvou acima.
  Substitua `` <howdy-kotlin-endpoint-here> `` com o ponto final howdy-kotlin que você salvou de cima.
  * Substitua `` <howdy-akka-endpoint-here> `` com o ponto final howdy-akka que você salvou de cima.
  * Substitua `` <node-nodejs-endpoint-here> `` com o ponto final howdy-nodejs que você salvou acima.
  * Substitua `` <howdy-python-endpoint-here> `` com o ponto final howdy-python que você salvou acima.
* `` cf push``
* Registre o ponto final do proxy porque vamos usá-lo abaixo para testar as chamadas da API

## Testar api (s)

```
http <proxy-end-point> / akka / users
http <proxy-end-point> / springboot / names
http <proxy-ponto final> / nodejs / howdy
http <ponto final do proxy> / kotlin / endereço
http <ponto final do proxy> / python / int
```