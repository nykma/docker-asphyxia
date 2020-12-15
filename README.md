# Asphyxia Docker image

An [Asphyxia](https://asphyxia-core.github.io) docker image.

## Usage

```sh
$ docker-compose pull
$ docker-compose up -d
# Visit service on port 8083
```

## Customize config

```sh
$ mkdir config
$ cp config.sample.ini config/config.ini
$ emacs config/config.ini
$ docker-compose up -d
```
