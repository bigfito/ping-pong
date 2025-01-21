#!/bin/bash

clear
echo "Deleting Datadog Agent deployemnt..."

kubectl delete deployment datadog-agent-cluster-agent

echo "Done"

exit 0