# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Run the container

Using the `docker` command:

    CONTAINER="adminer-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      dockerizedrupal/data:latest

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminer-data \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -d \
      dockerizedrupal/adminer:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Connect directly to MySQL server by linking with another Docker container

    CONTAINER="adminer-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      dockerizedrupal/data:latest
      
    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminer-data \
      --link mysqld:mysqld \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e MYSQLD_USERNAME="root" \
      -e MYSQLD_PASSWORD="root" \
      -d \
      dockerizedrupal/adminer:latest

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t dockerizedrupal/adminer:latest . \
      && cd -

## License

**MIT**
