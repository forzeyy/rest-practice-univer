#!/bin/bash

if ! minikube status | grep -q "host: Running"; then
  echo "launch minikube..."
  minikube start
fi

echo "docker-env activation..."
eval $(minikube docker-env)

echo "building docker image..."
docker build -t temp-converter-app:latest .

eval $(minikube docker-env -u)

echo "applying k8s manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "waiting for pod status ready..."
kubectl rollout status deployment/temp-converter-app --timeout=60s

MINIKUBE_IP=$(minikube ip)
NODE_PORT=$(kubectl get svc temp-converter-app-service -o jsonpath='{.spec.ports[0].nodePort}')

echo ""
echo "приложение развернуто"
echo "адрес: http://$MINIKUBE_IP:$NODE_PORT"