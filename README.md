# Dockerized test setup

In order to run this setup [Docker Desktop](https://www.docker.com/products/docker-desktop) must be installed.

## Clone Repository

```bash
git clone https://github.com/MoritzKronberger/ProjectSetupTest.git
cd ProjectSetupTest
```

## Create .env Files

.env variables can be changed by editing the bash script and executing it

**Passwords for Postgres database must not be included in bash script and should be passed as parameters**

```bash
bash create_dotenv.sh <superuser username> <superuser password> <regular user username> <regular user password>
```

## Build Images

```bash
docker-compose build
```

## Start Containers

```bash
docker-compose up
```

If only a certain container and its dependencies (for example the Postgres database and adminer) should be started, use:

```bash
docker-compose up postgres-db
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

## Shut Down Containers

```bash
docker-compose down
```
