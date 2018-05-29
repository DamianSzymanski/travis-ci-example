#! /bin/bash

set -ev

# Logger
. ./color-logger.bash

for run in {1..10}; do
  warn "Run $run of 10"

  info "Running traceroute to github.com..."
  time traceroute github.com

  info "Curling a docker-compose release from github..."
  time curl -sSfLv https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > docker-compose

  info "Cloning this repo (https)..."
  time git clone https://github.com/blimmer/travis-ci-example.git

  rm -fr travis-ci-example

  info "Cloning this repo (ssh)..."
  time git clone git@github.com:blimmer/travis-ci-example.git

  rm -fr travis-ci-example

  info "Running a traceroute to registry-1.docker.io..."
  time traceroute registry-1.docker.io
done

