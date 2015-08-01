#!/usr/bin/env bash
echo $project
cd $project
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main
