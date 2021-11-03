# Dockerized test setup

In order to run this setup [Docker Desktop](https://www.docker.com/products/docker-desktop) must be installed.

## Build Images

```bash
docker compose build
```

## Start Containers

```bash
docker compose up
```

## Access Microservices

Vue at <http://127.0.0.1:3000>

Express at <http://localhost:5000>

Adminer at <http://localhost:7000> with:

```txt
System: PostgreSQL
Server: flai-postgres-db
Username: flai_dev
Password: postgres
Database: flai_db_v1
```

## Shut down containers

```bash
docker compose down
```
