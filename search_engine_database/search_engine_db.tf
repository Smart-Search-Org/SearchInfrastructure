resource "kubernetes_manifest" "search_engine_db_deployment" {
  manifest = yamldecode(file("${path.module}/search_engine_db_deployment.yaml"))
}

resource "kubernetes_manifest" "search_engine_db_service" {
  manifest = yamldecode(file("${path.module}/search_engine_db_service.yaml"))
}
