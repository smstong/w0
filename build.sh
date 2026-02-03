#!/bin/bash
set -e
selfDir=$(cd `dirname $0`; pwd)
cd $selfDir

VERSION=$(date '+%Y.%m.%d')

# create backend images
docker build --platform=linux/amd64,linux/arm64 -t smstong/w0:$VERSION .
docker tag smstong/w0:$VERSION smstong/w0:latest

docker push smstong/w0:$VERSION
docker push smstong/w0:latest