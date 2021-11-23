export PROJECT_ID=`gcloud config get-value project` && \
export M_TYPE=n1-standard-2 && \
export ZONE=us-west2-a && \
export CLUSTER_NAME=${PROJECT_ID}-${RANDOM} && \
gcloud services enable container.googleapis.com && \
gcloud container clusters create $CLUSTER_NAME \
--cluster-version latest \
--machine-type=$M_TYPE \
--num-nodes 4 \
--zone $ZONE \
--project $PROJECT_ID