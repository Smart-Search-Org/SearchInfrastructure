resource "kubernetes_manifest" "test_db_deployment" {
  manifest = yamldecode(file("${path.module}/test_db_deployment.yaml"))
}

resource "kubernetes_manifest" "test_db_service" {
  manifest = yamldecode(file("${path.module}/test_db_service.yaml"))
}

