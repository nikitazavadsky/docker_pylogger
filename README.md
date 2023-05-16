# Dockerized Python logger & observer

This project contains 2 docker services - logger and log observer implemented in Python


### SETUP

  * Go to project directory
  * Run base image build command
    ```docker image build -f base.Dockerfile -t baseimage:v1 .```
  * Run logger image build command
    ```docker image build -f logger.Dockerfile -t loggerimage:v1 .```
  * Run log collector image build command
    ```docker image build -f log-collector.Dockerfile -t logcollectorimage:v1 .```\
  
  * OR: launch bash script to build all images at once:
    ```./build_all.sh```

### Logger

  Logger is a simple fastapi server that has only one endpoint (`GET`) on root (`/`) with query parameter `text`
  It writes logs to logs directory

  Request example: `GET` 0.0.0.0:8005?text=TEST

  * Run logger service:
  ```docker run --rm -p 8005:8000 -v /$(pwd)/logs/:/home/testuser/logger/logs/ -it -d loggerimage:v1```
  or
  * Run bash script ```./launch_logger.sh```

  * Now you can check api documentation at http://localhost:8005/docs and perform requests there
  
### Log reader

  Log reader goes through logs in logs directory and just prints them out

  Log collector is an executable container:

  * Run:
  ```docker run --rm -v /$(pwd)/logs/:/home/testuser/logs/ -it logcollectorimage:v1```
  or
  * Run bash script ```./collect_logs.sh```
