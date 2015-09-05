# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Run the container

Using the `docker` command:

    CONTAINER="adminer-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      dockerizedrupal/data:1.0.3

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminer-data \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e MYSQL_HOST="" \
      -e MYSQL_PORT="3306" \
      -e MYSQL_USERNAME="root" \
      -e MYSQL_PASSWORD="root" \
      -d \
      dockerizedrupal/adminer:1.0.4

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.4 \
      && sudo docker-compose up

## Connect directly to MySQL server by linking with another Docker container

    CONTAINER="adminer-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      dockerizedrupal/data:1.0.3
      
    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminer-data \
      --link mysql:mysql \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e MYSQL_USERNAME="root" \
      -e MYSQL_PASSWORD="root" \
      -d \
      dockerizedrupal/adminer:1.0.4

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.4 \
      && sudo docker build -t dockerizedrupal/adminer:1.0.4 . \
      && cd -

## License

**MIT**
