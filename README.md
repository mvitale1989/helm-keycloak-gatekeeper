# helm-keycloak-gatekeeper
A helm chart for installing an OpenID Connect authenticating proxy in front of your HTTP services. Based on the excellent [keycloak/keycloak-gatekeeper](https://github.com/keycloak/keycloak-gatekeeper).

### How it works

This charts installs a service, and optionally also an ingress, that sits between a _service_ (e.g. an internal ClusterIP service) and its clients, allowing incoming requests only if they've been authenticated by an OIDC provider of your choice.

### Example configuration

The following `values.yaml` lets you protect requests to the in-cluster service `my-service`, given a proper configuration of your IdP (e.g. registration of the `my-service` client, generation of a client-secret, etc):

```
upstreamUrl: "http://my-service:8080"

oidc:
  clientId: "my-service"
  clientSecret: "theSecretGeneratedByTheIdP"
  discoveryUrl: "https://idp.example.com/"

ingress:
  enabled: true
  annotations:
    kubernetes.io/tls-acme: "true"
  path: /
  hosts:
  - my-service.example.com
  tls:
  - secretName: tls-my-service
    hosts:
    - my-service.example.com
```

Check out `values.yaml` for other options tha are configurable in this chart.

### Future work

- Expose distributed caching flags, already implemented in keycloak/keycloak-gatekeeper (e.g. `--store-url=redis://127.0.0.1:6379`)
- Expose optional prometheus endpoint, through flags and proper pod/service configuration
- Expose tags flag, for configuring the forbidden/login templates
- Add option for specifying the redirect URL e.g. for logouts
