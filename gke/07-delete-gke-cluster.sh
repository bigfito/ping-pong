#!/bin/bash

CLUSTER_NAME="dev-pingpong-cluster"
GCP_REGION="northamerica-south1"

clear
echo "Deleting GKE cluster..."

gcloud container clusters delete $CLUSTER_NAME --region $GCP_REGION

echo "Done"

exit 0