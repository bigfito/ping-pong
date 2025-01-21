#!/bin/bash

clear

NS_CMD=$(kubectl get namespace | grep ping-pong)

if [ ${#NS_CMD} -eq 0 ]; then
  echo "Creating ping-pong app namespace"
  # The namespace manifest file must be located in the same directory of this script
  kubectl apply -f ./01-namespace.yaml
fi

echo " "
echo "Deploying Kubernetes services..."
kubectl apply -f ../ping/minikube/service.yaml
kubectl apply -f ../pong/minikube/service.yaml
kubectl apply -f ../handler/minikube/service.yaml

echo " "
echo "Deploying Kubernetes deployments..."
kubectl apply -f ../ping/minikube/deployment.yaml
kubectl apply -f ../pong/minikube/deployment.yaml
kubectl apply -f ../handler/minikube/deployment.yaml

echo " "
echo "Enabling port forwarding to frontend handler"
echo "Wait up 60 seconds..."
sleep 60
kubectl port-forward svc/handler 8080:8080 --namespace ping-pong

echo " "
echo "Done"

exit 0