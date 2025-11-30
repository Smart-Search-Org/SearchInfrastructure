# Install all monitoring stuff

## Install using helm

- `helm repo add grafana https://grafana.github.io/helm-charts`
- `helm repo update`

## Create namespace and deploy

- `kubectl create namespace monitoring`
- `helm install -n monitoring --values values.yaml loki-stack grafana/loki-stack`

