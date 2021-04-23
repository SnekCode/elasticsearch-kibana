{{- /*
This should be used with the $ scope
*/}}
{{- define "redirect_url" }}
  {{- if .Values.sso.redirect_url -}}
    {{ tpl .Values.sso.redirect_url . }}
  {{- else -}}
    {{ tpl (index .Values.istio.kibana.hosts 0) .}}
  {{- end }}
{{- end }}

{{- define "oidc" }}
{{- with .Values.sso }}
xpack.security.authc.realms.oidc.{{ .oidc.realm }}:
  order: 2
  rp.client_id: {{ .client_id }}
  rp.response_type: code
  rp.requested_scopes:
    {{- range .requested_scopes }}
    - {{ . | quote }}
    {{- end }}
  rp.redirect_uri: "https://{{ template "redirect_url" $ }}/api/security/v1/oidc"
  rp.post_logout_redirect_uri: "https://{{ template "redirect_url" $ }}/logged_out"
  op.issuer: {{ tpl .issuer $ }}
  op.authorization_endpoint: {{ tpl .auth_url $ }}
  op.token_endpoint: {{ tpl .token_url $ }}
  op.userinfo_endpoint: {{ tpl .userinfo_url $ }}
  op.jwkset_path: {{ tpl .jwkset_url $ }}
  claims.principal: {{ .claims_principal }}
  {{- /*Optional values should be nil checked*/ -}}
  {{- if .claims_principal_pattern }}
  claim_patterns.principal: {{ .claims_principal_pattern }}
  {{- end }}
  {{- if .signature_algorithm }}
  rp.signature_algorithm: {{ .signature_algorithm }}
  {{- end }}
  {{- if .endsession_url }}
  op.endsession_endpoint: {{ tpl .endsession_url $ }}
  {{- end }}
  {{- if .claims_group }}
  claims.groups: {{ .claims_group }}
  {{- end }}
  {{- if .claims_mail }}
  claims.mail: {{ .claims_mail }}
  {{- end }}
{{- end }}
{{- end }}