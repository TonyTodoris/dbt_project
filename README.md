# dbt_project
A simple dbt project to test locally the utilities of dbt.


### Prerequisites


1. [Docker](https://docs.docker.com/get-docker/) and [Docker compose](https://docs.docker.com/compose/install/)
2. [dbt](https://docs.getdbt.com/dbt-cli/installation/)
3. [pgcli](https://www.pgcli.com/install)
4. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Start the data warehouse docker container

```bash
docker compose up -d
```


## Run dbt 


```bash
export DBT_PROFILES_DIR=$(pwd)
cd dbt_project
dbt snapshot
dbt run
dbt test
dbt docs generate
dbt docs serve
```

Insert updates into source customer table, to demonstrate snapshot

```bash
pgcli -h localhost -U dbt -p 5432 -d dbt
# password is password1234
COPY warehouse.customers(customer_id, zipcode, city, state_code, datetime_created, datetime_updated) FROM '/input_data/customer_new.csv' DELIMITER ',' CSV HEADER;
\q
```

You can log into the data warehouse to see the models.

```bash
pgcli -h localhost -U dbt -p 5432 -d dbt
# password is password1234
SELECT customer_id, zipcode, datetime_updated,
 datetime_updated, dbt_valid_from, dbt_valid_to FROM snapshots.cus
 tomers_snapshot WHERE customer_id=82
\q
```


## Stop docker container


```bash
cd ..
docker compose down
```
