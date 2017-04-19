# PHASE INSTALLATION

Requis :
 - les fichiers ssl pour le https (server.key et server.crt) dans /etc/ssl/private.
  - un/des fichier(s) .sql ou .txt. 

## Pour MASTER & SLAVE

```sh
$ ssh-copy-id root@[host]
$ ssh root@[host]

$ apt-get update
$ curl -sSL https://get.docker.com/ | sh
$ apt-get -y dist-upgrade
```
Afin d'éviter que docker gère les iptables :
```sh
$ cat <<EOF >> /etc/default/docker
DOCKER_OPTS="--iptables=false"
EOF
```

```sh
$ reboot
$ docker run --rm hello-world
# Si ça ne fonctionne pas, installer docker une nouvelle fois.
# Pour savoir si les iptables sont toujours bien configurées, 
$ docker run -d --name test -p 7777:7777 -it ubuntu:14.04 bash
$ iptables -L | grep 7777
# Ne doit rien retourner.
$ docker rm -vf test # clean le container lancé
```

```sh
$ git clone https://github.com/Softinnov/bearded-deploy
$ cd bearded-deploy
```

## Pour MASTER

Récupérer les clés ssh dans /etc/ssl/private.  
Récupérer le(s) .sql et/ou .txt et le mettre dans le ~/bearded-deploy/data.

```sh
$ ./scripts/dbdata.sh `pwd`/data dbdata [noms sans .sql ou .txt]
$ curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
$ docker-compose -f production.yml up -d
```

Remettre le container `esc-sys` et le `crontab`
```
# m h  dom mon dow   command
0 5 1 * * docker run --link prod-db:db -v /var/log:/var/log softinnov/prod-sys /app/update-soldes.sh
0 1 * * * docker run --link prod-db:db -v /root/backups:/app/backups softinnov/prod-sys /app/mysql-backup.sh
```

## Pour SLAVE
```sh
$ ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -fNgL 3307:127.0.0.1:3306 root@[host master]
$ cd db/
$ docker run -d --restart=always -e REPLICATION_SLAVE=true -P --env-file=ENV_NET_HOST --net=host --name slave-bearded hub.softinnov.com/esc-db
```

# PHASE POST-INSTALLATION

## Phase développement

> Peut être utile de faire ce travail sur le serveur preprod pour faciliter le push.

##### Build & Push seulement esc-pdv
```sh
$ ./scripts/build.sh -p -i esc-pdv
```
##### Build & Push seulement le back
```sh
$ ./scripts/build.sh -p -i back -b `pwd`/[path vers bearded-basket]
```
##### Build & Push le back et esc-pdv
```sh
$ ./scripts/build.sh -p -i "back esc-pdv" -b `pwd`/[path vers bearded-basket]
```
##### Build & Push tous les containers
```sh
$ ./scripts/build.sh -p -b `pwd`/[bearded-basket]
```
##### Build sans push tous les containers
```sh
$ ./scripts/build.sh -b `pwd`/[bearded-basket]
```

## Pour update un container

```sh
$ cd ~/bearded-deploy/
$ docker-compose -f production.yml pull [*container(s)]
$ docker-compose -f production.yml up -d
```

_* les containers disponibles sont : consul, registrator, db, pdv, caisse, adm, smtp, back, client, monitor. (le link à consul oblige ce dernier à être pull aussi)_
