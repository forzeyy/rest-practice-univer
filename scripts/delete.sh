#!/bin/bash

kubectl delete service go-app-service
kubectl delete deployment go-app

echo "приложение удалено"