resource "kubernetes_manifest" "search_gateway_deployment" {
  manifest = yamldecode(file("${path.module}/search_gateway_deployment.yaml"))
}

resource "kubernetes_manifest" "search_gateway_service" {
  manifest = yamldecode(file("${path.module}/search_gateway_service.yaml"))
}
