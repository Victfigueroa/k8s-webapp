#!/bin/bash
echo "Eliminando deployment y service..."
kubectl delete -f deployment.yaml
kubectl delete -f service.yaml
echo "Eliminación completada."