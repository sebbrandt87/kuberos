#!/usr/bin/env sh

set -e

# Create the docker image
VERSION=$(git rev-parse --short HEAD)
docker push "sebbrandt87/kuberos:latest"
docker push "sebbrandt87/kuberos:${VERSION}"
