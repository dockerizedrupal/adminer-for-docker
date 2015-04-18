#!/usr/bin/env bash

puppet apply --modulepath=/src/adminer/run/modules /src/adminer/run/run.pp

/usr/bin/supervisord
