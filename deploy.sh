#!/bin/bash
echo "Desplegando aplicación en Kubernetes..."
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
echo "Despliegue completado."
