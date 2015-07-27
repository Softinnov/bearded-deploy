This program has been largely inspired by https://github.com/tutumcloud/mysql.

How to use it
=============

```sh
$ docker build -t mysql-softinnov .

$ docker run -d -e REPLICATION_MASTER=true -e REPLICATION_PASS=mypass -P --name master-bearded mysql-softinnov

$ docker exec -it master-bearded mysql -e "CREATE DATABASE $NAME;"

## Example
$ docker exec -it master-bearded mysql $NAME -e "CREATE TABLE Persons
(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255));"

$ docker exec -it master-bearded mysql $NAME -e "INSERT INTO Persons SET PersonID=1, LastName='Me', FirstName='Ni';"

$ docker exec -it master-bearded mysql $NAME -e "SELECT * FROM Persons"
# Should print 1 row

## First solution with --link
$ docker run -d -e REPLICATION_SLAVE=true -P --link master-bearded:mysql --name slave-bearded mysql-softinnov

## Second solution with --env-file
$ docker run -d -e REPLICATION_SLAVE=true -P --env-file=ENV --name slave-bearded mysql-softinnov
```

SSH Tunnel
==========

# Example
```sh
# create a ssh vpn with master between 3307 local port to remote 3306
$ ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -fNgL 3307:127.0.0.1:3306 root@$IP
```
