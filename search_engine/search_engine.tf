resource "kubernetes_manifest" "search_engine_deployment" {
  manifest = yamldecode(file("${path.module}/search_engine_deployment.yaml"))
}

resource "kubernetes_manifest" "search_engine_service" {
  manifest = yamldecode(file("${path.module}/search_engine_service.yaml"))
}

