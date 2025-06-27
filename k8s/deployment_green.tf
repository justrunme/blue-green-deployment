

resource "kubernetes_deployment" "app_green" {
  metadata {
    name      = "app-green"
    namespace = var.namespace
    labels = {
      app   = "app"
      color = "green"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app   = "app"
        color = "green"
      }
    }
    template {
      metadata {
        labels = {
          app   = "app"
          color = "green"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = var.app_version_green
          port {
            container_port = 80
          }
        }
      }
    }
  }
}