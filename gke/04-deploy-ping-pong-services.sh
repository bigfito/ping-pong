#!/bin/bash

clear

NS_CMD=$(kubectl get namespace | grep ping-pong)

if [ ${#NS_CMD} -eq 0 ]; then
  echo "Creating ping-pong app namespace"
  # The namespace manifest file must be located in the same directory of this script
  kubectl apply -f ./03-namespace.yaml
fi

echo " "
echo "Deploying ping-pong app services..."
kubectl apply -f ../ping/gke/service.yaml
kubectl apply -f ../pong/gke/service.yaml
kubectl apply -f ../handler/gke/service.yaml

echo " "
echo "Done"

exit 0