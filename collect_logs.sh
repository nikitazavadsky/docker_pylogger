#!/bin/sh
docker run --rm -v /$(pwd)/logs/:/home/testuser/logs/ -it logcollectorimage:v1