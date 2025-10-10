resource "kubernetes_manifest" "llm_deployment" {
  manifest = yamldecode(file("${path.module}/search_llm_deployment.yaml"))
}

resource "kubernetes_manifest" "llm_service" {
  manifest = yamldecode(file("${path.module}/search_llm_service.yaml"))

}

