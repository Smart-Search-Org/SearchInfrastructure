locals {
  keycloak_internal_url = "http://keycloak-service.${var.namespace}.svc.cluster.local"
}

# -------------------------
# Keycloak Deployment
# -------------------------
resource "kubernetes_manifest" "keycloak_deployment" {
  manifest = yamldecode(
    templatefile("${path.module}/manifests/keycloak_deployment.yaml", {
      namespace     = var.namespace
      db_host       = var.db_host
      db_port       = var.db_port
      db_user       = var.db_user
      db_password   = var.db_password
      admin_user    = var.admin_user
      admin_pass    = var.admin_password
    })
  )
}

# -------------------------
# Keycloak Service
# -------------------------
resource "kubernetes_manifest" "keycloak_service" {
  manifest = yamldecode(
    templatefile("${path.module}/manifests/keycloak_service.yaml", {
      namespace = var.namespace
    })
  )
}

# -------------------------
# Realm JSON ConfigMap
# -------------------------
resource "kubernetes_manifest" "keycloak_realm_configmap" {
  manifest = yamldecode(
    templatefile("${path.module}/manifests/keycloak_realm_configmap.yaml", {
      namespace     = var.namespace
      realm_name    = var.realm_name
      client_id     = var.client_id
      client_secret = var.client_secret
    })
  )

  depends_on = [kubernetes_manifest.keycloak_deployment]
}

# -------------------------
# Realm Import Job
# -------------------------
resource "kubernetes_manifest" "keycloak_realm_import_job" {
  manifest = yamldecode(
    templatefile("${path.module}/manifests/keycloak_realm_import_job.yaml", {
      namespace       = var.namespace
      keycloak_url    = local.keycloak_internal_url
      admin_user      = var.admin_user
      admin_pass      = var.admin_password
    })
  )

  depends_on = [
    kubernetes_manifest.keycloak_realm_configmap,
    kubernetes_manifest.keycloak_service
  ]
}

# -------------------------
# Node Client Config Map
# -------------------------
resource "kubernetes_manifest" "node_keycloak_configmap" {
  manifest = yamldecode(
    templatefile("${path.module}/manifests/keycloak_node_configmap.yaml", {
      namespace     = var.namespace
      realm_name    = var.realm_name
      client_id     = var.client_id
      client_secret = var.client_secret
      keycloak_url  = local.keycloak_internal_url
    })
  )

  depends_on = [kubernetes_manifest.keycloak_realm_import_job]
}
