#!/bin/bash

# This scripts helps you to prepare a new VPC to work with GKE services
# by executing a series of GCLOUD commands from Google Cloud's SDK
# It assumes you have already created a valid GCP PROJECT
# It assumes you will be running this script in a CLOUD SHELL WINDOW from your project
# It assumes you have already enabled the following APIs: GKE, SERVICE NETWORKING, BILLING
# Add execution privileges to the file: chmod +x filename
# Run the script: bash filename
# Author: Adolfo Orozco - bigfito@gmail.com

# VARIABLES SECTION
VPC_NAME="my-vpc"
SUBNET_NAME="a-subnet-vms-gke-nodes"
SUBNET_REGION="northamerica-south1"
SUBNET_CIDR="10.0.0.0/8"
SUBNET_1ST_SECONDARY_CIDR_NAME="b-subnet-pods"
SUBNET_1ST_SECONDARY_CIDR_RANGE="172.16.0.0/16"
SUBNET_2ND_SECONDARY_CIDR_NAME="c-subnet-services"
SUBNET_2ND_SECONDARY_CIDR_RANGE="192.168.0.0/25"
PARAM1="$SUBNET_1ST_SECONDARY_CIDR_NAME=$SUBNET_1ST_SECONDARY_CIDR_RANGE"
PARAM2="$SUBNET_2ND_SECONDARY_CIDR_NAME=$SUBNET_2ND_SECONDARY_CIDR_RANGE"
SECONDARY_RANGES_PARAM="$PARAM1,$PARAM2"
ROUTER_NAME="router-northamerica-south1"
NAT_GW_NAME="nat-gw-northamerica-south1"
PSA_RANGE_NAME="d-subnet-psa"
PSA_IP_RANGE="192.168.0.128"
PSA_IP_LENGHT="25"

clear

echo "Creating VPC in current project..."
gcloud compute networks create $VPC_NAME --subnet-mode=custom

echo "VPC ($VPC_NAME) has been created."
printf "\n"
echo "Press ANY key to continue..."
read -r PRESS_KEY

clear
echo "Creating SUBNET with secondary IP ranges..."
gcloud compute networks subnets create $SUBNET_NAME --network=$VPC_NAME --region=$SUBNET_REGION \
       --range=$SUBNET_CIDR --secondary-range=$SECONDARY_RANGES_PARAM --enable-private-ip-google-access

echo "SUBNET ($SUBNET_NAME) has been created."
printf "\n"
echo "Press ANY key to continue..."
read -r PRESS_KEY

clear
echo "Creating a PRIVATE SERVICE ACCESS SUBNET..."
gcloud compute addresses create $PSA_RANGE_NAME --global --purpose=VPC_PEERING \
       --addresses=$PSA_IP_RANGE --prefix-length=$PSA_IP_LENGHT --network=$VPC_NAME

gcloud services vpc-peerings connect --service=servicenetworking.googleapis.com \
       --ranges=$PSA_RANGE_NAME --network=$VPC_NAME

echo "PRIVATE SERVICE ACCESS IP range has been created for VPC ($VPC_NAME)."
printf "\n"
echo "Press ANY key to continue..."
read -r PRESS_KEY

clear
echo "Creating a default ROUTER in the REGION of SUBNET($SUBNET_NAME)..."
gcloud compute routers create $ROUTER_NAME --network=$VPC_NAME --region=$SUBNET_REGION

echo "Default router has been created."
printf "\n"
echo "Press ANY key to continue..."
read -r PRESS_KEY

clear
echo "Creating a NAT GATEWAY in the REGION of SUBNET($SUBNET_NAME)..."
gcloud compute routers nats create $NAT_GW_NAME --router=$ROUTER_NAME --region=$SUBNET_REGION \
       --nat-all-subnet-ip-ranges --auto-allocate-nat-external-ips

echo "Outgoing internet access has been configured now."
printf "\n"
echo "Press ANY key to continue..."
read -r PRESS_KEY

clear
echo "WARNING: You MUST create a connection between your PSA IP RANGE and Google Cloud Services."
echo "Go to your VPC landing page -> Private Service Access -> Private Connections to Services"
echo "CREATE CONNECTION.  Choose GOOGLE CLOUD PLATFORM and your PSA IP RANGE subnet."
echo "FINALLY, do not forget to create proper FIREWALL RULES to allow INBOUND traffic to your subnets."
printf "\n"
echo "Press ANY key to continue..."
read -r PRESS_KEY

echo "Bye-Bye!"

exit 0