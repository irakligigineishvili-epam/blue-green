# EPAM Helm Chart: Blue/Green

This folder contains a Helm parent chart (`epam/`) that deploys two subcharts: `blue/` and `green/`. The pattern is useful for managing paired applications (blue/green) under a single release while keeping each app configurable independently.

This README is written to be GitHub-friendly and provides a quickstart, command examples, and troubleshooting tips.

## Layout

```
helm/
├── README.md               # this file
├── blue/                   # Blue app subchart
│   ├── Chart.yaml
│   ├── templates/
│   └── values.yaml
├── green/                  # Green app subchart
│   ├── Chart.yaml
│   ├── templates/
│   └── values.yaml
├── epam/                   # parent chart
│   ├── Chart.lock
│   ├── Chart.yaml          # declares blue & green as dependencies
│   ├── charts/             # packaged dependencies (after helm dependency update)
│   ├── templates/
│   └── values.yaml         # base values for parent chart
└── custom-values.yaml      # example combined overrides for both subcharts
```

## Quick prerequisites

- Helm 3.x installed and on your PATH
- A Kubernetes cluster (minikube, kind, cloud, etc.)
- kubectl configured to talk to the target cluster

Optional but recommended:
- `metrics-server` if you rely on subchart HPAs

## Quickstart — install locally

1. Update dependencies for the parent chart (packages subcharts into `epam/charts/`):

```bash
cd helm/epam
helm dependency update
```

2. Install the parent chart using a combined values file (from `helm/`):

```bash
cd ..
helm install epam ./epam -f ./custom-values.yaml
```

3. Upgrade the release after changing values or templates:

```bash
helm upgrade epam ./epam -f ./custom-values.yaml
```

4. Uninstall and cleanup:

```bash
helm uninstall epam
# optionally remove leftover configmaps created by the subcharts
kubectl delete configmap -l app.kubernetes.io/instance=blue -n develop
kubectl delete configmap -l app.kubernetes.io/instance=green -n develop
```

## How dependencies work here

- The `epam/Chart.yaml` declares `blue` and `green` as chart dependencies using `file://` repository references. Running `helm dependency update` will package the subcharts into the parent `epam/charts/` directory so the parent release deploys both subcharts.

Example dependency section in `epam/Chart.yaml`:

```yaml
dependencies:
  - name: blue
    version: 0.1.0
    repository: "file://../blue"
  - name: green
    version: 0.1.0
    repository: "file://../green"
```

## Configuration

- Use `custom-values.yaml` to override values for both subcharts in a single place. Example keys in `custom-values.yaml`:

```yaml
blue:
  conf:
    appName: blue-app
    environment: production
  service:
    port: 8080

green:
  conf:
    appName: green-app
    environment: production
  service:
    port: 8081
```

Adjust these values to match your environment (namespaces, image tags, ports, ingress settings, etc.).

## Debugging and verification

- Render templates locally (no cluster):

```bash
helm template epam ./epam -f ../custom-values.yaml
```

- Check release and resources in cluster:

```bash
helm status epam
kubectl get all -l app.kubernetes.io/managed-by=Helm -n develop
```

## Tips and notes

- If you prefer a single stable Service for switching traffic (blue/green), implement a stable `nginx-svc` and update its selector to point at the desired instance.
- Consider specifying `host` in Ingress manifests in production to avoid unexpected matches.
- HPAs (if used) require a metrics provider like `metrics-server`.

## References

- Helm docs: https://helm.sh/docs/
- Helm dependency docs: https://helm.sh/docs/topics/charts/#chart-dependencies

---
If you want, I can also:
- add a `namespace.yaml` to create the target namespace,
- create a single `nginx-svc` stable service and a utility patch to flip selectors,
- or validate the charts with `helm lint` and `kubeval`.
