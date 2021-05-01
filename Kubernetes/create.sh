#!/bin/bash  

cp ./back-end.yaml /tmp/back-end.yaml

# Get user inputs for RDS   
echo "Please enter the RDS URL in the for (endpoint:port) : "
read rds_url
sed -i -e "s/rdsurlplaceholder/$rds_url/g" /tmp/back-end.yaml

echo "Please enter the RDS username : "
read rds_username
sed -i -e "s/rdsusernameplaceholder/$rds_username/g" /tmp/back-end.yaml

echo "Please enter the RDS password : "
read rds_password
sed -i -e "s/rdspasswordplaceholder/$rds_password/g" /tmp/back-end.yaml

eksctl create cluster --name TSCluster --region eu-west-2 --nodegroup-name TSNodeGroup --nodes 2 --nodes-min 2 --nodes-max 3 --node-type t3.small --ssh-access --ssh-public-key kp-setup-vm --managed --with-oidc

aws eks --region eu-west-2 update-kubeconfig --name TSCluster

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/aws/deploy.yaml

kubectl apply -f /tmp/back-end.yaml

kubectl apply -f ./back-end-service.yaml

kubectl apply -f ./front-end.yaml

kubectl apply -f ./front-end-service.yaml

sleep 120

kubectl apply -f ./ingress.yaml

sleep 60

kubectl get ingress