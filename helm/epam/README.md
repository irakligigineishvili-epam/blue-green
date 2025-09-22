# epam

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../blue | blue | 0.1.0 |
| file://../green | green | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| blue.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key | string | `"kubernetes.io/hostname"` |  |
| blue.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator | string | `"In"` |  |
| blue.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0] | string | `"minikube-m02"` |  |
| blue.autoscaling.behavior.enabled | bool | `false` |  |
| blue.autoscaling.enabled | bool | `true` |  |
| blue.autoscaling.maxReplicas | int | `5` |  |
| blue.autoscaling.minReplicas | int | `3` |  |
| blue.autoscaling.targetCPUUtilizationPercentage | int | `70` |  |
| blue.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| blue.conf.appName | string | `"blue"` |  |
| blue.conf.environment | string | `"development"` |  |
| blue.conf.tier | string | `"frontend"` |  |
| blue.conf.version | string | `"0.0.1"` |  |
| blue.configmap.binaryData | object | `{}` |  |
| blue.configmap.create | bool | `true` |  |
| blue.configmap.data."nginx.conf" | string | `"server {\n  listen 80;\n  server_name localhost;\n  location / {\n    return 200 \"Blue!\\n\";\n  }\n}\n"` |  |
| blue.image.pullPolicy | string | `"IfNotPresent"` |  |
| blue.image.repository | string | `"nginx"` |  |
| blue.image.tag | string | `"1.29"` |  |
| blue.ingress.className | string | `"nginx"` |  |
| blue.ingress.enabled | bool | `true` |  |
| blue.ingress.hosts[0].host | string | `""` |  |
| blue.ingress.hosts[0].paths[0].path | string | `"/blue"` |  |
| blue.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| blue.livenessProbe.httpGet.port | int | `80` |  |
| blue.livenessProbe.initialDelaySeconds | int | `5` |  |
| blue.livenessProbe.periodSeconds | int | `10` |  |
| blue.nodeSelector | object | `{}` |  |
| blue.podSecurityContext | object | `{}` |  |
| blue.readinessProbe.httpGet.port | int | `80` |  |
| blue.readinessProbe.initialDelaySeconds | int | `5` |  |
| blue.readinessProbe.periodSeconds | int | `10` |  |
| blue.replicaCount | int | `2` |  |
| blue.resources.limits.cpu | string | `"50m"` |  |
| blue.resources.limits.memory | string | `"128Mi"` |  |
| blue.resources.requests.cpu | string | `"25m"` |  |
| blue.resources.requests.memory | string | `"64Mi"` |  |
| blue.securityContext | object | `{}` |  |
| blue.service.port | int | `80` |  |
| blue.service.type | string | `"ClusterIP"` |  |
| blue.serviceAccount.automount | bool | `false` |  |
| blue.serviceAccount.create | bool | `true` |  |
| blue.serviceAccount.name | string | `"blue"` |  |
| blue.strategy.rollingUpdate.maxSurge | int | `1` |  |
| blue.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| blue.strategy.type | string | `"RollingUpdate"` |  |
| blue.tolerations | list | `[]` |  |
| blue.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/component" | string | `"frontend"` |  |
| blue.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/instance" | string | `"blue"` |  |
| blue.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/version" | string | `"0.0.1"` |  |
| blue.topologySpreadConstraints[0].maxSkew | int | `1` |  |
| blue.topologySpreadConstraints[0].minDomains | int | `1` |  |
| blue.topologySpreadConstraints[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| blue.topologySpreadConstraints[0].whenUnsatisfiable | string | `"DoNotSchedule"` |  |
| blue.volumeMounts[0].mountPath | string | `"/etc/nginx/conf.d"` |  |
| blue.volumeMounts[0].name | string | `"config-volume"` |  |
| blue.volumes[0].configMap.items[0].key | string | `"nginx.conf"` |  |
| blue.volumes[0].configMap.items[0].path | string | `"nginx.conf"` |  |
| blue.volumes[0].configMap.name | string | `"blue-config"` |  |
| blue.volumes[0].name | string | `"config-volume"` |  |
| green.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key | string | `"kubernetes.io/hostname"` |  |
| green.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator | string | `"In"` |  |
| green.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0] | string | `"minikube-m02"` |  |
| green.autoscaling.behavior.enabled | bool | `false` |  |
| green.autoscaling.enabled | bool | `true` |  |
| green.autoscaling.maxReplicas | int | `7` |  |
| green.autoscaling.minReplicas | int | `3` |  |
| green.autoscaling.targetCPUUtilizationPercentage | int | `70` |  |
| green.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| green.conf.appName | string | `"green"` |  |
| green.conf.environment | string | `"develop"` |  |
| green.conf.tier | string | `"frontend"` |  |
| green.conf.version | string | `"0.0.1"` |  |
| green.configmap.binaryData | object | `{}` |  |
| green.configmap.create | bool | `true` |  |
| green.configmap.data."nginx.conf" | string | `"server {\n  listen 80;\n  server_name localhost;\n  location / {\n    return 200 \"Green!\\n\";\n  }\n}\n"` |  |
| green.image.pullPolicy | string | `"IfNotPresent"` |  |
| green.image.repository | string | `"nginx"` |  |
| green.image.tag | string | `"1.29"` |  |
| green.ingress.className | string | `"nginx"` |  |
| green.ingress.enabled | bool | `true` |  |
| green.ingress.hosts[0].host | string | `""` |  |
| green.ingress.hosts[0].paths[0].path | string | `"/green"` |  |
| green.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| green.livenessProbe.httpGet.port | int | `80` |  |
| green.livenessProbe.initialDelaySeconds | int | `5` |  |
| green.livenessProbe.periodSeconds | int | `10` |  |
| green.nodeSelector | object | `{}` |  |
| green.podSecurityContext | object | `{}` |  |
| green.readinessProbe.httpGet.port | int | `80` |  |
| green.readinessProbe.initialDelaySeconds | int | `5` |  |
| green.readinessProbe.periodSeconds | int | `10` |  |
| green.replicaCount | int | `2` |  |
| green.resources.limits.cpu | string | `"50m"` |  |
| green.resources.limits.memory | string | `"128Mi"` |  |
| green.resources.requests.cpu | string | `"25m"` |  |
| green.resources.requests.memory | string | `"64Mi"` |  |
| green.securityContext | object | `{}` |  |
| green.service.port | int | `80` |  |
| green.service.type | string | `"ClusterIP"` |  |
| green.serviceAccount.automount | bool | `false` |  |
| green.serviceAccount.create | bool | `true` |  |
| green.serviceAccount.name | string | `"green"` |  |
| green.strategy.rollingUpdate.maxSurge | int | `1` |  |
| green.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| green.strategy.type | string | `"RollingUpdate"` |  |
| green.tolerations | list | `[]` |  |
| green.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/component" | string | `"frontend"` |  |
| green.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/instance" | string | `"green"` |  |
| green.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/version" | string | `"0.0.1"` |  |
| green.topologySpreadConstraints[0].maxSkew | int | `1` |  |
| green.topologySpreadConstraints[0].minDomains | int | `1` |  |
| green.topologySpreadConstraints[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| green.topologySpreadConstraints[0].whenUnsatisfiable | string | `"DoNotSchedule"` |  |
| green.volumeMounts[0].mountPath | string | `"/etc/nginx/conf.d"` |  |
| green.volumeMounts[0].name | string | `"config-volume"` |  |
| green.volumes[0].configMap.items[0].key | string | `"nginx.conf"` |  |
| green.volumes[0].configMap.items[0].path | string | `"nginx.conf"` |  |
| green.volumes[0].configMap.name | string | `"green-config"` |  |
| green.volumes[0].name | string | `"config-volume"` |  |

