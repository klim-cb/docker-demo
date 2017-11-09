#!/usr/bin/env bash
set -u
name="${name:-demo1}"
version=$(git rev-parse HEAD 2>/dev/null | cut -c 1-7)
image="${image:-127.0.0.1:30400/$name}"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ && pwd )"
echo $DIR
cd $DIR
docker build -t $image:$version .
docker build -t $image:latest .