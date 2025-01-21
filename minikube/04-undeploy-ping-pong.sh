#!/bin/bash

echo "Removing ping-pong app..."

kubectl delete -f ./01-namespace.yaml

echo "Done"

exit 0
