DEPLOYEMENT
===========

A `dbdata` container needs to be built first.

### Debian/Ubuntu

Be aware that you need the ssl certificates already on the server.

Then, you just need to run:
```bash
$ ./scripts/update.sh
```
It will pull images from the registry and launch them.
You can also specify which image has to be updated with `-i "IMAGES"`.
`-h` flag prints an help message.


BUILD
=====

To build the images, you just have to call:
```bash
$ ./scripts/build.sh -d [PROJECT_DIRECTORY]
```
To push them to the registry, add the `-p` flag.
To print the help message, add `-h`.
