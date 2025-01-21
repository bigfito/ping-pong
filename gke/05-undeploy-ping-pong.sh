#!/bin/bash

clear
echo "Removing ping-pong app namespace..."

kubectl delete -f ./03-namespace.yaml

echo "Done"

exit 0