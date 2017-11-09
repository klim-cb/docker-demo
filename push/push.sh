#!/usr/bin/env bash
set -u
name="${name:-demo1}"
version=$(git rev-parse HEAD 2>/dev/null | cut -c 1-7)
image="${image:-127.0.0.1:30400/$name}"
docker push $image:$version
docker push $image:latest