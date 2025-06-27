

resource "kubernetes_namespace" "bluegreen" {
  metadata {
    name = var.namespace
  }
}