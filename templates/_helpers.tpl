{{/* vim: set filetype=mustache: */}}

{{/* Create a default fully qualified app name. */}}
{{- define "auth-proxy.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "auth-proxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Labels to attach to every auth-proxy object. */}}
{{- define "auth-proxy.labels" -}}
heritage: {{ .Release.Service }}
release: {{ .Release.Name }}
chart: {{ include "auth-proxy.chart" . }}
{{ if .Values.extraLabels -}}
{{ .Values.extraLabels | toYaml }}
{{- end -}}
component: {{ .Chart.Name }}
{{- end -}}
