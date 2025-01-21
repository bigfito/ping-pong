#!/bin/bash

clear
echo "Deleting Datadog Agent deployemnt..."

kubectl delete deployment datadog-agent-cluster-agent
kubectl delete daemonset datadog-agent
kubectl delete svc name datadog-agent
kubectl delete svc name datadog-agent-cluster-agent
kubectl delete svc name datadog-agent-cluster-agent-admission-controller

echo "Done"

exit 0