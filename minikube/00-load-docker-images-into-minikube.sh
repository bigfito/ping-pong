#!/bin/bash

clear
echo "Loading ping-pong images into MiniKube..."

minikube image load ping:1.0
minikube image load pong:1.0
minikube image load handler:1.0

echo "Done"

exit 0