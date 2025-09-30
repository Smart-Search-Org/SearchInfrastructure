terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.26"
    }
  }
}

provider "kubernetes" {
  config_path = "${path.module}/minikube_tf.yaml"
}
