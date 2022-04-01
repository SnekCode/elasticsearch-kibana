# logging

![Version: 0.7.0-bb.0](https://img.shields.io/badge/Version-0.7.0--bb.0-informational?style=flat-square) ![AppVersion: 7.17.1](https://img.shields.io/badge/AppVersion-7.17.1-informational?style=flat-square)

Configurable Deployment of Elasticsearch and Kibana Custom Resources Wrapped Inside a Helm Chart.

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install logging chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hostname | string | `"bigbang.dev"` | Domain used for BigBang created exposed services. |
| autoRollingUpgrade.enabled | bool | `true` | Enable BigBang specific autoRollingUpgrade support |
| imagePullPolicy | string | `"IfNotPresent"` | Pull Policy for all non-init containers in this package. |
| kibana.version | string | `"7.17.1"` | Kibana version |
| kibana.image.repository | string | `"registry1.dso.mil/ironbank/elastic/kibana/kibana"` | Kibana image repository |
| kibana.image.tag | string | `"7.17.1"` | Kibana image tag |
| kibana.host | string | `""` | Kibana Ingress Host Value. Only required if not using Istio for ingress. |
| kibana.count | int | `3` | Number of Kibana replicas |
| kibana.serviceAccountName | string | `"logging-kibana"` | Name for serviceAccount to use, will be autocreated. |
| kibana.updateStrategy.type | string | `"rollingUpdate"` | Kibana updateStrategy type |
| kibana.updateStrategy.rollingUpdate.maxUnavailable | int | `1` | Kibana updateStrategy maxUnavailable |
| kibana.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | Set securityContext for Kibana pods |
| kibana.imagePullSecrets | list | `[]` | Kibana imagePullSecrets |
| kibana.resources.requests.cpu | int | `1` | Kibana CPU request |
| kibana.resources.requests.memory | string | `"2Gi"` | Kibana Memory request |
| kibana.resources.limits.cpu | int | `1` | Kibana CPU limit |
| kibana.resources.limits.memory | string | `"2Gi"` | KIbana Memory limit |
| kibana.volumes | list | `[]` | Kibana volumes |
| kibana.volumeMounts | list | `[]` | Kibana volumeMounts |
| kibana.podAnnotations | object | `{}` | Kibana podAnnotations |
| kibana.affinity | object | `{}` | Kibana affinity |
| kibana.tolerations | list | `[]` | Kibana tolerations |
| kibana.nodeSelector | object | `{}` | Kibana nodeSelector |
| kibana.lifecycle | object | `{}` | Kibana lifecycle |
| elasticsearch.version | string | `"7.17.1"` | Elasticsearch version |
| elasticsearch.image.repository | string | `"registry1.dso.mil/ironbank/elastic/elasticsearch/elasticsearch"` | Elasticsearch image repository |
| elasticsearch.image.tag | string | `"7.17.1"` | Elasticsearch image tag |
| elasticsearch.imagePullSecrets | list | `[]` | Elasticsearch imagePullSecrets |
| elasticsearch.serviceAccountName | string | `"logging-elasticsearch"` | Name for serviceAccount to use, will be autocreated. |
| elasticsearch.master.initContainers | list | `[]` | Add an init container that adjusts the kernel setting for elastic. |
| elasticsearch.master.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | Set securityContext for elasticsearch master node sets |
| elasticsearch.master.updateStrategy.type | string | `"rollingUpdate"` | Elasticsearch master updateStrategy type |
| elasticsearch.master.updateStrategy.rollingUpdate.maxUnavailable | int | `1` | Elasticsearch master rollingUpdate maxUnavailable |
| elasticsearch.master.volumes | list | `[]` | Elasticsearch master volumes |
| elasticsearch.master.volumeMounts | list | `[]` | Elasticsearch master volumeMounts |
| elasticsearch.master.podAnnotations | object | `{}` | Elasticsearch master podAnnotations |
| elasticsearch.master.affinity | object | `{}` | Elasticsearch master affinity |
| elasticsearch.master.tolerations | list | `[]` | Elasticsearch master tolerations |
| elasticsearch.master.nodeSelector | object | `{}` | Elasticsearch master nodeSelector |
| elasticsearch.master.lifecycle | object | `{}` | Elasticsearch master lifecycle |
| elasticsearch.master.count | int | `3` | Elasticsearch master pod count |
| elasticsearch.master.persistence.storageClassName | string | `""` | Elasticsearch master persistence storageClassName |
| elasticsearch.master.persistence.size | string | `"5Gi"` | Elasticsearch master persistence size |
| elasticsearch.master.resources.limits.cpu | int | `1` | Elasticsearch master pod CPU limit |
| elasticsearch.master.resources.limits.memory | string | `"4Gi"` | Elasticsearch master pod Memory limit |
| elasticsearch.master.resources.requests.cpu | int | `1` | Elasticsearch master pod CPU request |
| elasticsearch.master.resources.requests.memory | string | `"4Gi"` | Elasticsearch master pod Memory request |
| elasticsearch.master.heap.min | string | `"2g"` | Elasticsearch master Java heap Xms setting |
| elasticsearch.master.heap.max | string | `"2g"` | Elasticsearch master Java heap Xmx setting |
| elasticsearch.data.initContainers | list | `[]` | Add an init container that adjusts the kernel setting for elastic. |
| elasticsearch.data.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | Set securityContext for elasticsearch data node sets |
| elasticsearch.data.volumes | list | `[]` | Elasticsearch data volumes |
| elasticsearch.data.volumeMounts | list | `[]` | Elasticsearch data volumeMounts |
| elasticsearch.data.podAnnotations | object | `{}` | Elasticsearch data podAnnotations |
| elasticsearch.data.affinity | object | `{}` | Elasticsearch data affinity |
| elasticsearch.data.tolerations | list | `[]` | Elasticsearch data tolerations |
| elasticsearch.data.nodeSelector | object | `{}` | Elasticsearch data nodeSelector |
| elasticsearch.data.lifecycle | object | `{}` | Elasticsearch data lifecycle |
| elasticsearch.data.count | int | `4` | Elasticsearch data pod count |
| elasticsearch.data.persistence.storageClassName | string | `""` | Elasticsearch data persistence storageClassName |
| elasticsearch.data.persistence.size | string | `"100Gi"` | Elasticsearch data persistence size |
| elasticsearch.data.resources.limits.cpu | int | `1` | Elasticsearch data pod CPU limits |
| elasticsearch.data.resources.limits.memory | string | `"4Gi"` | Elasticsearch data pod Memory limits |
| elasticsearch.data.resources.requests.cpu | int | `1` | Elasticsearch data pod CPU requests |
| elasticsearch.data.resources.requests.memory | string | `"4Gi"` | Elasticsearch data pod Memory requests |
| elasticsearch.data.heap.min | string | `"2g"` | Elasticsearch data Java heap Xms setting |
| elasticsearch.data.heap.max | string | `"2g"` | Elasticsearch data Java heap Xmx setting |
| elasticsearch.ingest.enabled | bool | `false` | Enable ingest specific Elasticsearch pods |
| elasticsearch.ingest.initContainers | list | `[]` | initContainers |
| elasticsearch.ingest.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | Set securityContext for elasticsearch ingest node sets |
| elasticsearch.ingest.volumes | list | `[]` | volumes |
| elasticsearch.ingest.volumeMounts | list | `[]` | volumeMounts |
| elasticsearch.ingest.podAnnotations | object | `{}` | podAnnotations |
| elasticsearch.ingest.affinity | object | `{}` | affinity |
| elasticsearch.ingest.tolerations | list | `[]` | tolerations |
| elasticsearch.ingest.nodeSelector | object | `{}` | nodeSelector |
| elasticsearch.ingest.lifecycle | object | `{}` | lifecycle |
| elasticsearch.ingest.count | int | `1` | count |
| elasticsearch.ingest.persistence.storageClassName | string | `""` | storageClassName |
| elasticsearch.ingest.persistence.size | string | `"100Gi"` | size |
| elasticsearch.ingest.resources.limits.cpu | int | `1` | CPU limits |
| elasticsearch.ingest.resources.limits.memory | string | `"4Gi"` | Memory limits |
| elasticsearch.ingest.resources.requests.cpu | int | `1` | CPU requests |
| elasticsearch.ingest.resources.requests.memory | string | `"4Gi"` | Memory requests |
| elasticsearch.ingest.heap.min | string | `"2g"` | Xms |
| elasticsearch.ingest.heap.max | string | `"2g"` | Xmx |
| elasticsearch.ml.enabled | bool | `false` | Enable Machine Learning specific Elasticsearch pods |
| elasticsearch.ml.initContainers | list | `[]` | initContainers |
| elasticsearch.ml.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | Set securityContext for elasticsearch ml node sets |
| elasticsearch.ml.updateStrategy.type | string | `"rollingUpdate"` |  |
| elasticsearch.ml.updateStrategy.rollingUpdate.maxUnavailable | int | `1` | maxUnavailable |
| elasticsearch.ml.volumes | list | `[]` | volumes |
| elasticsearch.ml.volumeMounts | list | `[]` | volumeMounts |
| elasticsearch.ml.podAnnotations | object | `{}` | podAnnotations |
| elasticsearch.ml.affinity | object | `{}` | affinity |
| elasticsearch.ml.tolerations | list | `[]` | tolerations |
| elasticsearch.ml.nodeSelector | object | `{}` | nodeSelector |
| elasticsearch.ml.lifecycle | object | `{}` | lifecycle |
| elasticsearch.ml.count | int | `1` | count |
| elasticsearch.ml.persistence.storageClassName | string | `""` | storageClassName |
| elasticsearch.ml.persistence.size | string | `"100Gi"` | size |
| elasticsearch.ml.resources.limits.cpu | int | `1` | CPU limits |
| elasticsearch.ml.resources.limits.memory | string | `"4Gi"` | Memory limits |
| elasticsearch.ml.resources.requests.cpu | int | `1` | CPU requests |
| elasticsearch.ml.resources.requests.memory | string | `"4Gi"` | Memory requests |
| elasticsearch.ml.heap.min | string | `"2g"` |  |
| elasticsearch.ml.heap.max | string | `"2g"` | Xmx |
| elasticsearch.coord.enabled | bool | `false` | Enable coordinating specific Elasticsearch pods |
| elasticsearch.coord.initContainers | list | `[]` | initContainers |
| elasticsearch.coord.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | Set securityContext for elasticsearch coordinating node sets |
| elasticsearch.coord.updateStrategy.type | string | `"rollingUpdate"` | type |
| elasticsearch.coord.updateStrategy.rollingUpdate.maxUnavailable | int | `1` | maxUnavailable |
| elasticsearch.coord.volumes | list | `[]` | volumes |
| elasticsearch.coord.volumeMounts | list | `[]` | volumeMounts |
| elasticsearch.coord.podAnnotations | object | `{}` | podAnnotations |
| elasticsearch.coord.affinity | object | `{}` | affinity |
| elasticsearch.coord.tolerations | list | `[]` | tolerations |
| elasticsearch.coord.nodeSelector | object | `{}` | nodeSelector |
| elasticsearch.coord.lifecycle | object | `{}` | lifecycle |
| elasticsearch.coord.count | int | `1` | count |
| elasticsearch.coord.persistence.storageClassName | string | `""` | storageClassName |
| elasticsearch.coord.persistence.size | string | `"100Gi"` | size |
| elasticsearch.coord.resources.limits.cpu | int | `1` | cpu limits |
| elasticsearch.coord.resources.limits.memory | string | `"4Gi"` | memory limits |
| elasticsearch.coord.resources.requests.cpu | int | `1` | cpu requests |
| elasticsearch.coord.resources.requests.memory | string | `"4Gi"` | memory requests |
| elasticsearch.coord.heap.min | string | `"2g"` | Xms |
| elasticsearch.coord.heap.max | string | `"2g"` | Xmx |
| istio.enabled | bool | `false` | Toggle istio interaction. |
| istio.kibana.enabled | bool | `true` | Toggle virtualService creation |
| istio.kibana.annotations | object | `{}` | Annotations for controls the gateway used/attached to the virtualService |
| istio.kibana.labels | object | `{}` | Labels for virtualService |
| istio.kibana.gateways | list | `["istio-system/main"]` | Gateway(s) to apply virtualService routes to. |
| istio.kibana.hosts[0] | string | `"kibana.{{ .Values.hostname }}"` | hosts |
| sso.enabled | bool | `false` | Toggle and configure SSO with Keycloak. Example values are for local development. |
| sso.redirect_url | string | `""` | redirect_url defaults to .Values.istio.kibana.hosts[0] if not set. |
| sso.client_id | string | `"platform1_a8604cc9-f5e9-4656-802d-d05624370245_bb8-kibana"` | client_id |
| sso.client_secret | string | `""` | OIDC client secret, can be empty for public client. |
| sso.oidc.host | string | `"login.dso.mil"` | host |
| sso.oidc.realm | string | `"baby-yoda"` | realm |
| sso.issuer | string | `"https://{{ .Values.sso.oidc.host }}/auth/realms/{{ .Values.sso.oidc.realm }}"` |  |
| sso.auth_url | string | `"https://{{ .Values.sso.oidc.host }}/auth/realms/{{ .Values.sso.oidc.realm }}/protocol/openid-connect/auth"` | auth_url |
| sso.token_url | string | `"https://{{ .Values.sso.oidc.host }}/auth/realms/{{ .Values.sso.oidc.realm }}/protocol/openid-connect/token"` | token_url |
| sso.userinfo_url | string | `"https://{{ .Values.sso.oidc.host }}/auth/realms/{{ .Values.sso.oidc.realm }}/protocol/openid-connect/userinfo"` | userinfo_url |
| sso.jwkset_url | string | `"https://{{ .Values.sso.oidc.host }}/auth/realms/{{ .Values.sso.oidc.realm }}/protocol/openid-connect/certs"` | jwks_url |
| sso.claims_principal | string | `"preferred_username"` | claims_principal |
| sso.requested_scopes | list | `["openid"]` | requested_scopes |
| sso.signature_algorithm | string | `"RS256"` |  |
| sso.endsession_url | string | `"https://{{ .Values.sso.oidc.host }}/auth/realms/{{ .Values.sso.oidc.realm }}/protocol/openid-connect/logout"` |  |
| sso.claims_group | string | `"groups"` | claims_group |
| sso.claims_mail | string | `"email"` | claims_mail |
| sso.claims_principal_pattern | string | `""` |  |
| sso.cert_authorities | list | `[]` | cert_authorities |
| kibanaBasicAuth.enabled | bool | `true` | Toggle this to turn off Kibana's built in auth and only allow SSO. Role mappings for SSO groups must be set up and SSO enabled before doing this. |
| networkPolicies.enabled | bool | `false` | Toggle BigBang NetworkPolicy templates |
| networkPolicies.ingressLabels | object | `{"app":"istio-ingressgateway","istio":"ingressgateway"}` | Istio Ingressgateway labels. passed down to NetworkPolicy to whitelist external access to app |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` | See `kubectl cluster-info` and then resolve to IP |
| upgradeJob.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` | image repository for upgradeJob |
| upgradeJob.image.tag | float | `8.4` | image tag for upgradeJob |
| openshift | bool | `false` | Openshift Container Platform Feature Toggle |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_expect_logs | string | `"false"` |  |
| bbtests.cypress.envs.cypress_kibana_url | string | `"https://logging-ek-kb-http:5601/login"` |  |
| bbtests.cypress.secretEnvs[0].name | string | `"cypress_elastic_password"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"logging-ek-es-elastic-user"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"elastic"` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/stedolan/jq:1.6"` |  |
| bbtests.scripts.envs.elasticsearch_host | string | `"https://{{ .Release.Name }}-es-http.{{ .Release.Namespace }}.svc.cluster.local:9200"` |  |
| bbtests.scripts.envs.desired_version | string | `"{{ .Values.elasticsearch.version }}"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"ELASTIC_PASSWORD"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"logging-ek-es-elastic-user"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"elastic"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
