# docker-tidyverse-rjava

[rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse) with java and rJava.

Also includes `RJDBC` and `odbc` packages.

## Using `docker-compose`

Clone this repo and then run `docker-compose` to start up the container.


```
# Clone the repo
git clone https://github.com/gadenbuie/docker-tidyverse-rjava.git
cd docker-tidyverse-rjava

# Start the container
docker-compose up -d --build
```

The `import/` folder is automatically mounted in the container at `/home/rstudio/import` and the `USER` and `PASSWORD` fields are set inside the `docker-compose.yml` file; view the file to see these passwords or edit the file to change them.

## Using Oracle Drivers

Oracle InstaClient drivers are not included in this image because Oracle requires users to log in before downloading them.

To obtain the drivers, visit <https://www.oracle.com/technetwork/database/database-technologies/instant-client/overview/index.html>, click _Download_ and choose the _Basic_ or _Basic Light_ Instant Client Package for Linux x86-64. Copy the downloaded zip file into the `import/` folder of this repo and extract.

If you use `docker-compose` to start up the docker image, you can then reference the `odbc8.jar` file in `~/import/instantclient_12_2/odbc8.jar` for use with RJDBC.

## Run the container without `docker-compose`

```
docker build -t tidyverse-rjava:latest .

docker run -d -rm -p 8787:8787 \
  -e PASSWORD="YourPassWordHere" \
  -v ./import:/home/rstudio/import \
  tidyverse-rjava:latest
```

