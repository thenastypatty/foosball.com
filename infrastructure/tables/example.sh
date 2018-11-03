#!/usr/bin/env bash

docker-compose up -d
sleep 5
env POSTGRES_PASSWORD=postgres migrate --source "file://$(pwd)" --database 'postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable' --verbose up