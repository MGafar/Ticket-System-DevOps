#!/bin/bash
# Delete kubernetes NetworkLoadBalancer, Ingress, SpringBoot pods + service, ReactJS pods + service

kubectl delete -f ./front-end-service.yaml

kubectl delete -f ./front-end.yaml

kubectl delete -f ./back-end-service.yaml

kubectl delete -f ./back-end.yaml

kubectl delete -f ./ingress.yaml

kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.45.0/deploy/static/provider/aws/deploy.yaml

eksctl delete cluster --name TSCluster