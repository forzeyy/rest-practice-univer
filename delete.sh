#!/bin/bash

kubectl delete service temp-converter-app-service
kubectl delete deployment temp-converter-app

echo "приложение удалено"