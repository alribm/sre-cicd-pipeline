#!/bin/bash

echo " Aplicando manifiestos del stack de observabilidad..."

# Storage primero
kubectl apply -f ./storage.yaml

# Aplicación base
kubectl apply -f ./deployment.yaml

# Collector
kubectl apply -f ./otel-collector.yaml

# Jaeger
kubectl apply -f ./jaeger.yaml

# Prometheus (RBAC + servicio)
kubectl apply -f ./prometheus-rbac-cluster.yaml
kubectl apply -f ./prometheus.yaml

# Grafana + Loki
kubectl apply -f ./grafana-loki.yaml
kubectl apply -f ./grafana.yaml

echo "✅ Todos los manifiestos aplicados."

# Mostrar estado de pods
kubectl get pods -A
