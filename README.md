# docker-adminer-dev

A [Docker](https://docker.com/) container for [Adminer](http://www.adminer.org/).

Only MySQL support at the moment.

## Adminer (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="adminer" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -e MYSQLD_USERNAME="root" \
      -e MYSQLD_PASSWORD="root" \
      -d \
      simpledrupalcloud/adminer:dev
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-adminer.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/adminer:dev . \
      && cd -

## License

**MIT**
