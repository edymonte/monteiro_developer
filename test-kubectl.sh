#!/bin/bash

RESOURCE_GROUP="rg-spring-aks"
AKS_CLUSTER="aks-spring-demo"

echo "✅ Obtendo kubeconfig..."
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER --overwrite-existing

echo "✅ Testando kubectl get nodes..."
kubectl get nodes

echo "✅ Testando kubectl get pods..."
kubectl get pods --all-namespaces

