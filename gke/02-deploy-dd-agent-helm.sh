#!/bin/bash

DD_VALUES_FILENAME="datadog-values.yaml"

clear
echo "Deploying Datadog Agent by HELM chart..."

helm repo add datadog-crds https://helm.datadoghq.com
helm repo add kube-state-metrics https://prometheus-community.github.io/helm-charts
helm repo add datadog https://helm.datadoghq.com
helm repo update

kubectl create secret generic datadog-secret --from-literal api-key="$DD_API_KEY"
helm install datadog-agent -f "$DD_VALUES_FILENAME" datadog/datadog

echo " "
echo "Done"

exit 0