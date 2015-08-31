Cruder Base Project
===================

This project aims to provide a general purpose CRUDer machine.
It is simply a Docker container, based on the "mongo" base container, with the following aditions:
- node.js (the lastest version, from the source)
- mongodb-rest project (see https://www.npmjs.com/package/mongodb-rest for details).

How to test:
```
curl -d '{ "A1" : 201 }' -H "Content-Type: application/json" http://localhost:32829/test/example1
```
