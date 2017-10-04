#!/usr/bin/env bash

set -e

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $# -ne 1 ]]; then
    echo "You must set a version number"
    echo "./deploy.sh <terraform version>"
    exit 1
fi

version=$1
dockerfile_version=$(grep TERRAFORM_VERSION= ${base}/Dockerfile | cut -d= -f2)

if [[ $version != $dockerfile_version ]]; then
    echo "Version mismatch in 'Dockerfile'"
    echo "found ${dockerfile_version}, expected ${version}."
    echo "Make sure the versions are correct."
    exit 1
fi

echo "Building docker images for terraform ${version}..."
docker build -f "${base}/Dockerfile" -t therasec/terraform-providers:latest .
docker tag therasec/terraform-providers:latest therasec/terraform-providers:${version}

echo "Uploading docker images for terraform ${version}..."
docker push therasec/terraform-providers:${version}
docker push therasec/terraform-providers:latest
