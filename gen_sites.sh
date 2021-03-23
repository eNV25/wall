#!/bin/sh
for i in $(seq 50); do echo 'https://windows10spotlight.com/page'; done | awk '{printf "%s/%s\n", $0, ++i}'
