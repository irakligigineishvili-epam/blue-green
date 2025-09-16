# Blue and Green Apps for Kubernetes

This directory contains Kubernetes manifests for deploying two simple nginx-based apps. Each app has its own Deployment, Service, ConfigMap and Ingress. The manifests target the `develop` namespace and assume an `nginx` ingressClass.

## Files in this folder

- `deployment-blue.yaml` - Deployment for the blue app
- `deployment-green.yaml` - Deployment for the green app
- `service-blue.yaml` - ClusterIP service exposing the blue app
- `service-green.yaml` - ClusterIP service exposing the green app
- `config-blue.yaml` - ConfigMap used by the blue nginx to return a simple response
- `config-green.yaml` - ConfigMap used by the green nginx to return a simple response
- `ingress-blue.yaml` - Ingress routing path `/blue` to the blue service
- `ingress-green.yaml` - Ingress routing path `/green` to the green service
- `hpa-blue.yaml` / `hpa-green.yaml` - Horizontal Pod Autoscalers for each deployment

## Quick prerequisites

- A Kubernetes cluster with the `develop` namespace (manifests include `namespace: develop`).
- An ingress controller that honors `ingressClassName: nginx` (or edit the field to match your ingress class).
- `kubectl` configured to talk to the cluster.
- (Optional) `metrics-server` or equivalent for HPA to work.

## Apply all resources (recommended order)

Apply namespace (if you don't have it) and the ConfigMaps, Deployments, Services, HPA and Ingress. Example:

```bash
# create namespace if missing
kubectl create ns develop --dry-run=client -o yaml | kubectl apply -f -

# configmaps
kubectl apply -f config-blue.yaml
kubectl apply -f config-green.yaml

# deployments
kubectl apply -f deployment-blue.yaml
kubectl apply -f deployment-green.yaml

# services
kubectl apply -f service-blue.yaml
kubectl apply -f service-green.yaml

# autoscalers (requires metrics-server)
kubectl apply -f hpa-blue.yaml
kubectl apply -f hpa-green.yaml

# ingresses (adjust ingressClassName/host as needed)
kubectl apply -f ingress-blue.yaml
kubectl apply -f ingress-green.yaml
```
