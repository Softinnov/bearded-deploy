BUILD DB MANUALLY
=================

Having the `esc` folder as follow:

```
  esc/
  ├── esc-adm/
  │   └── ...      (preprod branch)
  ├── esc-caisse/
  │   └── ...      (preprod branch)
  └── esc-pdv/
      └── ...      (preprod branch)
  └── data/
```

With an escarcelle mysql dump in 'data' folder.

First, create the data volume container

```
docker run -d --name dbdata hub.softinnov.com/esc-db echo data-only
```

Then create the mysql container :

```
docker run -d -v $(pwd)/data:/data --name esc-db --volumes-from dbdata -e REPLICATION_MASTER=true -e REPLICATION_PASS=mypass -e MYSQL_USER=admin -e MYSQL_PASS=admin hub.softinnov.com/esc-db
```

Create the 'prod' database : 

```
docker exec esc-db mysql -uadmin -padmin -e "CREATE DATABASE prod" 
```

If the dump is gzip-compressed, decompress it :

```
gunzip -f data/160628.sql.gz
```

At last, import the dump (be patient, the 'mvt' table is very big)

```
docker exec -i esc-db mysql -uadmin -padmin prod < $(pwd)/data/160628.sql
```

