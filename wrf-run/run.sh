#!/bin/bash

xargs -n 1 -P 4 curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:$1 -O < urls.txt

python rename.py