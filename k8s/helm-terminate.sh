#!/bin/bash

helm uninstall mongo 
helm uninstall mongo-express
helm uninstall api 
helm uninstall frontend

kubectl delete -f mongo-secret.yaml
kubectl delete -f mongo-configmap.yaml
kubectl delete -f mongo-pvc.yaml
kubectl delete -f ingress-service.yaml
