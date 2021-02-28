# DAOC-vilnius-tech-shard

## Scripts

.env has to be set up 

#### build.sh
```
Builds DOLSharp project using mono container.
```
**TODO:** Add possibility to build either Debug or Release versions.

#### run.sh
```
Runs DOLSharp server locally using mono container.
Exposes port 10300.
```
**TODO:** Apply different configurations depending on if the server is run via `run.sh` or `docker-compose`

#### db-concat.sh
```
Runs concat script on the database and copies the resulting .SQL file to /data folder.
```

#### db-apply.sh
```
Applies .SQL files that had not been applied to the database. Applied filenames are saved in .applied file.
```


#### docker-compose
```
docker-compose is set up to launch mariadb database, adminer and the game server inside docker containers.
```
