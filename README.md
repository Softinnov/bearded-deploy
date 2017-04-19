Bienvenue sur le repo de déploiement du projet [Escarcelle](https://escarcelle.net).

Technologies
============

Le projet est développé en plusieurs technologies :
- Une partie en [REBOL](http://www.rebol.com/). Actuellement, la grande majorité du site est écrite dans ce langage.
- Plusieurs petites parties en [Go](https://golang.org/). Petit à petit, l'application en REBOL est remplacé par un système de micro sevices écrits en Go. Jusqu'à maintenant, seule la _Gestion Utilisateur_ l'est.
- [AngularJS](https://angularjs.org/) est utilisé pour la partie client du site. Plus particulièrement sur la partie remplacé par Go.
- [Docker](https://www.docker.com/) est là pour faire toute la gestion de la construction, le lancement et le déploiement des applications. Chaque application est containerisé afin d'avoir chacune un objectif unique et pouvoir ainsi se répliquer plus facilement et rapidement.
- [Consul](https://www.consul.io/) est l'application qui (couplée à [Registrator](https://github.com/gliderlabs/registrator) et [consul-template](https://github.com/hashicorp/consul-template)) nous sert à dynamiquement détecter un nouveau container qui serait lancé, stocker en mémoire son adresse/port et le signaler automatiquement aux autres containers en fonctionnement.

#### [Procédure de déploiement](./docs/DEPLOYMENT.md)

#### [Mise en production](./docs/MISE-EN-PROD.md)

#### [Développement](./docs/DEVELOPMENT.md)

Architecture
============

![architecture](https://docs.google.com/drawings/d/19kQsvhiq-QVkVmBhlErZEeFcUaN10SFxRQm-7NFvhok/pub?w=1143&h=684)
