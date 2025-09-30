resource "kubernetes_manifest" "llm_deployment" {
  manifest = yamldecode(file("${path.module}/search_llm_deployment.yaml"))

  depends_on = [kubernetes_namespace.smart_search]
}

resource "kubernetes_manifest" "llm_service" {
  manifest = yamldecode(file("${path.module}/search_llm_service.yaml"))

  depends_on = [kubernetes_namespace.smart_search]
}

