# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Run the container

Using the `docker` command:

    CONTAINER="adminerdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      viljaste/data:latest

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminerdata \
      -e SERVER_NAME="localhost" \
      -d \
      viljaste/adminer:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Connect directly to MySQL server by linking with another Docker container

    CONTAINER="adminerdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      viljaste/data:latest
      
    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminerdata \
      --link mysqld:mysqld \
      -e SERVER_NAME="localhost" \
      -e MYSQLD_USERNAME="root" \
      -e MYSQLD_PASSWORD="root" \
      -d \
      viljaste/adminer:latest

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/adminer:latest . \
      && cd -

## License

**MIT**
