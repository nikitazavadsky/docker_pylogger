#!/bin/sh
docker run --rm -p 8005:8000 -v /$(pwd)/logs/:/home/testuser/logger/logs/ -it -d loggerimage:v1