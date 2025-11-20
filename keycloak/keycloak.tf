resource "kubernetes_manifest" "keycloak_deployment" {
  manifest = yamldecode(file("${path.module}/keycloak_deployment.yaml"))
}

resource "kubernetes_manifest" "keycloak_service" {
  manifest = yamldecode(file("${path.module}/keycloak_service.yaml"))
}
