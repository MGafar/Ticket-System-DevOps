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

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/aws/deploy.yaml

kubectl apply -f /tmp/back-end.yaml

kubectl apply -f ./back-end-service.yaml

kubectl apply -f ./front-end.yaml

kubectl apply -f ./front-end-service.yaml

sleep 30

kubectl apply -f ./ingress.yaml

sleep 30

kubectl get ingress