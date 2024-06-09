#!/bin/bash


kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo-configmap.yaml
kubectl apply -f mongo-pvc.yaml

helm upgrade mongo ./mongo-chart --install
helm upgrade mongo-express ./mongo-express-chart --install
helm upgrade api ./api-chart --install 
helm upgrade frontend ./frontend-chart --install

kubectl apply -f ingress-service.yaml
