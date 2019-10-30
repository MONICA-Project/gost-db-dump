# gost-db-dump

This is a simple docker-compose setup to dump a GOST database from the MONICA cloud and deploy it locally on your machine. Check first if the database you want to export has a manageable size:

```sql
SELECT pg_size_pretty( pg_database_size('<db_name>') );
```

Then copy `docker-compose-example.yml` to `docker-compose.yml` and enter the necessary environment variables for your use case and run

```bash
docker-compose up gost-db-dump
```

This may take a few minutes and will create a dump of the database to file `./dumps/gost.sql`. Your Postgres user needs to have the necessary permissions.

To import the database to a local deployment run

```bash
docker-compose up gost-db
```

This will run the script `./docker-entrypoint-initdb.d/import.sh` that imports the dump file `./dumps/gost.sql` created in the first step into a fresh database named `gost`. Note that this will only run as long as your Docker volume `pgdata` is empty. So if the process fails at some point and you want to repeat the import you might have to remove the volume before, e.g.:

```bash
volume rm gostdbdump_pgdata
```
