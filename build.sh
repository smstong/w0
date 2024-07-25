#!/bin/bash
set -e
selfDir=$(cd `dirname $0`; pwd)
cd $selfDir

function Usage(){
	echo -e "Usage: $(basenae $0) [ version ]"
	exit
}

APP_NAME=w0
VERSION=${1:-latest}
ARCHS=(amd64 arm64)
TAGS=()
MANIFEST=smstong/$APP_NAME:$VERSION

# build/push images for each platform
for arch in ${ARCHS[@]}; do
	tag=smstong/${APP_NAME}-${arch}:$VERSION
	docker build --platform linux/$arch -t $tag .
	docker push $tag
	TAGS+=($tag)
done

# build/push manifest
docker manifest create --amend $MANIFEST ${TAGS[@]}
docker manifest push $MANIFEST
