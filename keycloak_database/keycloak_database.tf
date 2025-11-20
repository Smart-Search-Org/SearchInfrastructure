resource "kubernetes_manifest" "keycloak_db_deployment" {
  manifest = yamldecode(file("${path.module}/keycloak_database_deployment.yaml"))
}

resource "kubernetes_manifest" "keycloak_db_service" {
  manifest = yamldecode(file("${path.module}/keycloak_database_service.yaml"))
}
