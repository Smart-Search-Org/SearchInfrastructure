output "keycloak_internal_url" {
  value = "http://keycloak-service.${var.namespace}.svc.cluster.local"
}

output "client_secret" {
  value = var.client_secret
}

output "realm" {
  value = var.realm_name
}
