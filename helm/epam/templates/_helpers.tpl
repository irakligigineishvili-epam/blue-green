{{/*
Expand the name of the chart.
*/}}
{{- define "epam.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "epam.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of deployment
*/}}
{{- define "epam.deployment" -}}
{{- printf "%s-deployment" .Values.conf.appName }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "epam.labels" -}}
helm.sh/chart: {{ include "epam.chart" . }}
{{ include "epam.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "epam.selectorLabels" -}}
app.kubernetes.io/instance: {{ .Values.conf.appName }}
app.kubernetes.io/component: {{ .Values.conf.tier }}
environment: {{ .Values.conf.environment }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "epam.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- printf "%s-sa" (default "default" .Values.conf.appName) }}
{{- end }}
{{- end }}

{{/*
Create the name of the configmap to use
*/}}
{{- define "epam.configmap" -}}
{{- if .Values.configmap.create }}
{{- printf "%s-config" (default "default" .Values.conf.appName) }}
{{- end }}
{{- end }}
