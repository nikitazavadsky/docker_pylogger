# Dockerized Python logger & observer

This project contains 2 docker services - logger and log observer implemented in Python


### SETUP

  * Go to project directory
  * Run image build command
    ```docker image build -f Dockerfile -t baseimage:v1 . --no-cache```

### Logger

  Logger is a simple fastapi server that has only one endpoint (`GET`) on root (`/`) with query parameter `text`
  It writes logs to logs directory

  Request example: `GET` 0.0.0.0:8005?text=TEST

  * Run logger service (Don't forget to update `<ABSOLUTE PATH TO PROJECT>`, see Notes below):
  ```docker run --rm -it -v <ABSOLUTE PATH TO PROJECT>:/home/testuser -p 8005:8000 -d baseimage:v1 uvicorn main:app --reload --host 0.0.0.0```
  * Now you can check api documentation at http://localhost:8005/docs
  
### Log reader

  Log reader goes through logs in logs directory and just prints them out

  Log collector is an executable container:

  * Run:
  ```docker run --rm -it -v <ABSOLUTE PATH TO PROJECT>:/home/testuser/ baseimage:v1 python3 log_collector.py```
  or
  * Double-click on `collect_logs.bat` in the project structure (Don't forget to update `<ABSOLUTE PATH TO PROJECT>`)
  or
  * Run .bat file with terminal: ```./collect_logs.bat```

### Notes

Example of `<ABSOLUTE PATH TO PROJECT>` variable: D:/Study/repos/docker_pylogger