resource "kubernetes_manifest" "search_engine_pvc" {
  manifest = yamldecode(file("${path.module}/search_engine_pvc.yaml"))
}

resource "kubernetes_manifest" "search_engine_deployment" {
  manifest = yamldecode(file("${path.module}/search_engine_deployment.yaml"))
  depends_on = [kubernetes_manifest.search_engine_pvc]
}

resource "kubernetes_manifest" "search_engine_service" {
  manifest = yamldecode(file("${path.module}/search_engine_service.yaml"))
}

