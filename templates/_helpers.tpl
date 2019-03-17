{{/* vim: set filetype=mustache: */}}

{{/* Create a default fully qualified app name. */}}
{{- define "keycloak-gatekeeper.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "keycloak-gatekeeper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Labels to attach to every keycloak-gatekeeper object. */}}
{{- define "keycloak-gatekeeper.labels" -}}
heritage: {{ .Release.Service }}
release: {{ .Release.Name }}
chart: {{ include "keycloak-gatekeeper.chart" . }}
{{ if .Values.extraLabels -}}
{{ .Values.extraLabels | toYaml }}
{{- end -}}
component: {{ .Chart.Name }}
{{- end -}}
