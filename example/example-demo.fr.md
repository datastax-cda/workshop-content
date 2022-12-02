# Une démo du runtime polyglotte de Cloud Foundry

Ce module a pour objectif de mettre en place plusieurs microservices implémentés dans différentes langues fonctionnant dans une fonderie dans le cloud. L'un des avantages des microservices est le pouvoir de choisir. Si vous êtes un geek java, utilisez java, python ... hé, allez-y, kotlin encore mieux! Utilisez ce que vous et votre équipe êtes à l'aise. Le fait est que ... plus vous variez, plus il devient difficile à opérationnaliser, mais de telles choses ne doivent pas nous affliger au XXIe siècle. Entrez dans Cloud Foundry ... cela aide le choix du développeur tout en maintenant la santé opérationnelle ... et la santé mentale est importante.

Cette démonstration fournit une interface API aux microservices suivants, que nous allons créer et appliquer à Cloud Foundry.

* Howdy-Akka
* comment démarrer
* Howdy-Kotlin
* howdy-nodejs
* Howdy-Python

## Exigences

* L'accès à un déploiement Cloud Foundry, [PWS] (https://run.pivotal.io) est agréable ou [PCF Dev] (https://pivotal.io/pcf-dev)
* Téléchargez et installez [cf-cli] (https://pivotal.io/platform/pcf-tutorials/getting-started-with-pivotal-cloud-foundry/install-the-cf-cli)
* Téléchargez et installez [HTTPie] (https://httpie.org/) qui est utilisé ci-dessous comme «http».

### Connexion à Cloud Foundry (pws affichés)

* `` cf login -a api.run.pivotal.io``

## Exigences

## Construire et Push des projets

1. Ouvrez un terminal et clonez un atelier de démonstration avec github repo: <https://github.com/Pivotal-Field-Engineering/pace-cnd-java>

1. Accédez au dossier "cloud-native-platform".

`` `
    cd ./cloud-native-platform
`` `

### Construire et pousser howdy-akka

* `` cd howdy-akka``
* `` sbt assembly``
* `` cf push``
* Enregistrez le point final

### Construire et pousser howdy-boot

* `` cd howdy-boot``
* `` mvnw clean package``
* `` cf push``
* Enregistrez le point final

### Construire et pousser howdy-kotlin

* `` cd howdy-kotlin``
* `` mvnw clean package``
* `` cf push``
* Enregistrez le point final

### Construire et pousser howdy-nodejs

* `` cd howdy-nodejs``
* `` cf push``
* Enregistrez le point final

### Construire et pousser howdy-python

* `` cd howdy-python``
* `` cf push``
* Enregistrez le point final

### Construire et pousser howdy-proxy

* `` cd howdy-proxy``
* `` mvnw clean package``
* Ajouter le (s) point (s) final (s) dans manifest.yml
  * Remplacez `` <<howdy-boot-endpoint-here> `` par `avec le point final howdy-boot que vous avez enregistré ci-dessus.
  * Remplacez `` <howdy-kotlin-endpoint-here> `` par le point final howdy-kotlin que vous avez enregistré ci-dessus.
  * Remplacez `` <<howdy-akka-endpoint-here> `` `par le point final de howdy-akka que vous avez enregistré ci-dessus.
  * Remplacez `` <<howdy-nodejs-endpoint-here> `` `par le point final de howdy-nodejs que vous avez enregistré ci-dessus.
  * Remplacez `` <<howdy-python-endpoint-here> `` par `avec le point final howdy-python que vous avez enregistré ci-dessus.
* `` cf push``
* Enregistrez le point de terminaison du proxy, car nous l'utilisons ci-dessous pour tester les appels api

## Test api (s)

```
http <point de terminaison du proxy> / akka / users
http <point de terminaison du proxy> / springboot / names
http <point de terminaison du proxy> / nodejs / howdy
http <point de terminaison du proxy> / kotlin / address
http <point de terminaison du proxy> / python / int
```