resource "kubernetes_namespace" "smart_search" {
  metadata {
    name = "smart-search"
  }
}
