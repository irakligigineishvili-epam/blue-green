# Blue and Green Apps for Kubernetes

This directory contains Kubernetes manifests for deploying two independent applications: **blue** and **green**. Each app has its own deployment, service, configuration, and optional ingress files.

## Files

- `deployment-blue.yaml`: Deployment manifest for the blue app
- `deployment-green.yaml`: Deployment manifest for the green app
- `service-blue.yaml`: Service definition for the blue app
- `service-green.yaml`: Service definition for the green app
- `config-blue.yaml`: Configuration for the blue app
- `config-green.yaml`: Configuration for the green app
- `ingress-blue.yaml`: Ingress resource to expose only the blue app
- `ingress-green.yaml`: Ingress resource to expose only the green app

## How to Use

Apply resources using `kubectl`:

```sh
kubectl apply -f deployment-blue.yaml
kubectl apply -f service-blue.yaml
kubectl apply -f config-blue.yaml

kubectl apply -f deployment-green.yaml
kubectl apply -f service-green.yaml
kubectl apply -f config-green.yaml

kubectl apply -f ingress-blue.yaml 
kubectl apply -f ingress-green.yaml
## Ingress paths

If you use the provided per-app ingress resources, they expose each app under a path prefix on the same host (depending on your ingress controller/host configuration).

- `ingress-blue.yaml`
	- path prefix: `/blue`
	- service: `nginx-blue`
	- port: `80`
	- namespace: `develop`
	- ingressClassName: `nginx`

- `ingress-green.yaml`
	- path prefix: `/green`
	- service: `nginx-green`
	- port: `80`
	- namespace: `develop`
	- ingressClassName: `nginx`

```
