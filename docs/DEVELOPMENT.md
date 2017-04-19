DEVELOPMENT
===========

You'll need:
 - go
 - docker
 - docker-compose

Having the `esc` folder as follow:
```
  esc/
  ├── esc-adm/
  │   └── ...      (preprod branch)
  ├── esc-caisse/
  │   └── ...      (preprod branch)
  └── esc-pdv/
      └── ...      (preprod branch)
```

Then run the compilation of `back`:
```sh
$ cd back && ./compile.sh [path to bearded-basket] && cd ..
```

Then build the images using docker-compose:
```sh
$ docker-compose -f development.yml build
```

Finally run all the containers:
```sh
$ docker-compose -f development.yml up -d
```

DEPLOYEMENT
===========

A `dbdata` container needs to be built first.

To build it, launch
```bash
$ ./scripts/dbdata.sh <data path> <data container name> [table names...]
```

### Debian/Ubuntu

Be aware that you need the ssl certificates already on the server.

Then, you just need to run compose. It will pull images from the registry and launch them.
```bash
$ compose -f production.yml up -d
```

BUILD
=====

*Only necessary if the registry is not accessible*

To build the images, you just have to call:
```bash
$ ./scripts/build.sh -d [PROJECT_DIRECTORY]
```
To push them to the registry, add the `-p` flag.
To print the help message, add `-h`.
