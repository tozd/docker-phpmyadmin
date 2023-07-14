#!/bin/sh

set -e

cleanup() {
  set +e

  echo "Logs"
  docker logs test

  echo "Stopping Docker image"
  docker stop test
  docker rm -f test
}

echo "Running Docker image"
docker run -d --name test -p 80:80 "${CI_REGISTRY_IMAGE}:${TAG}"
trap cleanup EXIT

echo "Sleeping"
sleep 10

echo "Testing"
wget -q -O - http://docker/phpmyadmin/ | grep -q '<title>phpMyAdmin</title>'
echo "Success"
