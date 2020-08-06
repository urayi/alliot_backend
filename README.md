Proyecto BACKEND para ingreso a Alliot

## Inicio de la aplicación





Things you may want to cover:

* Ruby version: ruby-2.7.0

* System dependencies

* Configuration

Para levantar el sistema de debe ejecutar
```sh
$ gem update --system  && rails server
```

Para crear y levantar el contenedor de Docker
```sh
$ docker build --build-arg MASTER_KEY=c2209b422db318ad96c12dcb0bebe271 -t alliot/backend .
$ docker run --rm -d  -p 3000:3000/tcp alliot/backend:latest
```