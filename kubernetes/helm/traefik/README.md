# Traefik 2

- `helm repo add traefik https://containous.github.io/traefik-helm-chart`
- `kubectl create namespace traefik`
- `helm install -f values.yaml --namespace "traefik" "traefik" traefik/traefik`