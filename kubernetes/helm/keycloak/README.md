# Keycloak

- `helm install -f values.yaml keycloak codecentric/keycloak`
- `kubectl get secret --namespace default keycloak-http -o jsonpath="{.data.password}" | base64 --decode; echo`