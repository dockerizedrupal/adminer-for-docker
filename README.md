# docker-adminer

A Docker image for [Adminer](http://www.adminer.org/) that is used in the [Dockerized Drupal](https://dockerizedrupal.com/) project.

## Run the container

    CONTAINER="adminer-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      dockerizedrupal/data:1.1.0

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminer-data \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e MYSQL_HOST="" \
      -e MYSQL_PORT="3306" \
      -e MYSQL_USERNAME="container" \
      -e MYSQL_PASSWORD="container" \
      -e PHP_INI_MAX_EXECUTION_TIME="900" \
      -e HTTP_BASIC_AUTH="Off" \
      -e HTTP_BASIC_AUTH_USERNAME="container" \
      -e HTTP_BASIC_AUTH_PASSWORD="" \
      -d \
      dockerizedrupal/adminer:1.1.0

## Connect directly to MySQL server by linking to another Docker container

    CONTAINER="adminer-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      dockerizedrupal/data:1.1.0
      
    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminer-data \
      --link mysql:mysql \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e PROTOCOLS="https,http" \
      -e MYSQL_USERNAME="container" \
      -e MYSQL_PASSWORD="container" \
      -e PHP_INI_MAX_EXECUTION_TIME="900" \
      -e HTTP_BASIC_AUTH="Off" \
      -e HTTP_BASIC_AUTH_USERNAME="container" \
      -e HTTP_BASIC_AUTH_PASSWORD="" \
      -d \
      dockerizedrupal/adminer:1.1.0

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.1.0 \
      && sudo docker build -t dockerizedrupal/adminer:1.1.0 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**
