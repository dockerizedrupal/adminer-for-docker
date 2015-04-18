#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/adminer/build.sh && /src/adminer/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/adminer/variables.sh && /src/adminer/run.sh"
    ;;
esac
