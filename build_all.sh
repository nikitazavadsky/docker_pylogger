#!/bin/sh

docker image build -f base.Dockerfile -t baseimage:v1 .
docker image build -f logger.Dockerfile -t loggerimage:v1 .
docker image build -f log-collector.Dockerfile -t logcollectorimage:v1 .
