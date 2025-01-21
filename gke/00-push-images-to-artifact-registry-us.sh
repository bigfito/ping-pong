#!/bin/bash

# This scripts helps you copying container images from your local docker repository
# to an ARTIFACT REPOSITORY (REPO_NAME) in Google Cloud Platform
# Add execution privileges to the file: chmod +x filename
# Run the script: bash filename
# Author: Adolfo Orozco - bigfito@gmail.com

# VARIABLES SECTION
REPO_NAME="pingpong-us"
GCP_PROJECT="bigfito-dev"
GCP_REGION="us-central1"
TAG_PARAM="$GCP_REGION-docker.pkg.dev/$GCP_PROJECT/$REPO_NAME"

clear

echo "Setting the current project..."
gcloud config set project $GCP_PROJECT

echo "Authenticating to the REPO..."
gcloud auth configure-docker $GCP_REGION-docker.pkg.dev

echo "Tagging ping container image..."
docker tag ping:1.0 $TAG_PARAM/ping:1.0

echo "Tagging pong container image..."
docker tag pong:1.0 $TAG_PARAM/pong:1.0

echo "Tagging handler container image..."
docker tag handler:1.0 $TAG_PARAM/handler:1.0

echo "Pushing addition container image..."
docker push $TAG_PARAM/ping:1.0

echo "Pushing subtraction container image..."
docker push $TAG_PARAM/pong:1.0

echo "Pushing multiplication container image..."
docker push $TAG_PARAM/handler:1.0

echo "Done"

exit 0