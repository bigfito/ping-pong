#!/bin/bash

# VARIABLES SECTION
GCP_PROJECT="bigfito-dev"
GKE_CLUSTER_NAME="dev-cluster-us"
GCP_REGION="us-central1"
MACHINE_TYPE="e2-micro"
DISK_SIZE="64"
NUM_NODES="2"
CLUSTER_NETWORK="projects/savvy-serenity-447419-d2/global/networks/core-vpc"
NODES_NETWORK="projects/savvy-serenity-447419-d2/regions/$GCP_REGION/subnetworks/e-subnet-vms-gke-nodes"
PODS_NETWORK="f-subnet-pods"
SERVICES_NETWORK="g-subnet-services"

clear
echo "Creating GKE cluster..."

gcloud beta container --project $GCP_PROJECT clusters create $GKE_CLUSTER_NAME --region $GCP_REGION \
       --tier "standard" --no-enable-basic-auth --cluster-version "1.30.6-gke.1596000" \
       --release-channel "regular" --machine-type $MACHINE_TYPE --image-type "COS_CONTAINERD" \
       --disk-type "pd-balanced" --disk-size $DISK_SIZE --metadata disable-legacy-endpoints=true \
       --scopes "https://www.googleapis.com/auth/cloud-platform" --num-nodes $NUM_NODES --logging=SYSTEM,WORKLOAD \
       --monitoring=SYSTEM,STORAGE,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA,CADVISOR,KUBELET \
       --enable-private-nodes --enable-ip-alias --network $CLUSTER_NETWORK --subnetwork $NODES_NETWORK \
       --cluster-secondary-range-name $PODS_NETWORK --services-secondary-range-name $SERVICES_NETWORK \
       --no-enable-intra-node-visibility --default-max-pods-per-node "110" --enable-ip-access \
       --security-posture=standard --workload-vulnerability-scanning=disabled --no-enable-master-authorized-networks \
       --no-enable-google-cloud-access --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver \
       --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --labels env=dev \
       --binauthz-evaluation-mode=DISABLED --enable-managed-prometheus --workload-pool "bigfito-dev.svc.id.goog" \
       --enable-shielded-nodes --enable-secret-manager --enable-l4-ilb-subsetting

echo "Done"

exit 0