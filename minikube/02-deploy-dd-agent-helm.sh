#!/bin/bash

clear
echo "Deploying Datadog Agent by using a HELM chart..."

helm repo add datadog https://helm.datadoghq.com
helm repo update
kubectl create secret generic datadog-secret --from-literal api-key=a7a5f1a39cca50b45fb225bd700152a7

helm install datadog-agent -f datadog-values.yaml datadog/datadog

echo " "
echo "Done"

exit 0