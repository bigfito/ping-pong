#!/bin/bash

GCP_PROJECT="bigfito-dev"
GCP_REGION="northamerica-south1"
CLUSTER_NAME="bigfito-cluster"
NODE_POOL_NAME="default-pool"
NUM_NODES=0

echo "Setting context to project..."
gcloud config set project $GCP_PROJECT

echo "Scaling down cluster to 0 nodes..."
gcloud container clusters resize $CLUSTER_NAME \
       --node-pool=$NODE_POOL_NAME \
       --num-nodes=$NUM_NODES \
       --region=$GCP_REGION

exit 0