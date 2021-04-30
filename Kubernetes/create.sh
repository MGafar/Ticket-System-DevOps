#!/bin/bash
# Create kubernetes NetworkLoadBalancer, Ingress, SpringBoot pods + service, ReactJS pods + service 

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/aws/deploy.yaml

kubectl apply -f ./back-end.yaml

kubectl apply -f ./back-end-service.yaml

kubectl apply -f ./front-end.yaml

kubectl apply -f ./front-end-service.yaml

sleep 30

kubectl apply -f ./ingress.yaml

sleep 30

kubectl get ingress