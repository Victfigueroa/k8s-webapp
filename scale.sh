#!/bin/bash
echo "Escalando deployment a 4 réplicas..."
kubectl scale deployment webapp-deployment --replicas=4
kubectl get pods
