#!/bin/bash

docker run --privileged -v /home/cfallin:/home/cfallin -d -p 2222:22 moz-dev
