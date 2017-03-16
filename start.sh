#!/bin/sh
mkdir -p ./jenkins_home
mkdir -p ./registry_data

docker-compose up -d
