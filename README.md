# docker-adminer

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

## Run the container

Using the `docker` command:

    CONTAINER="adminerdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      viljaste/data:dev

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from adminerdata \
      -e SERVER_NAME="localhost" \
      -d \
      viljaste/adminer:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

## Connect directly to MySQL server by linking with another Docker container

    CONTAINER="adminerdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /adminer \
      viljaste/data:dev
      
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
      viljaste/adminer:dev

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t viljaste/adminer:dev . \
      && cd -

## Back up Adminer data

    sudo docker run \
      --rm \
      --volumes-from adminerdata \
      -v $(pwd):/backup \
      viljaste/base:dev tar czvf /backup/adminerdata.tar.gz /adminer

## Restore Adminer data from a backup

    sudo docker run \
      --rm \
      --volumes-from adminerdata \
      -v $(pwd):/backup \
      viljaste/base:dev tar xzvf /backup/adminerdata.tar.gz

## License

**MIT**
