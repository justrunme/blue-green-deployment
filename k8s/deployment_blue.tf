

resource "kubernetes_deployment" "app_blue" {
  metadata {
    name      = "app-blue"
    namespace = var.namespace
    labels = {
      app   = "app"
      color = "blue"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app   = "app"
        color = "blue"
      }
    }
    template {
      metadata {
        labels = {
          app   = "app"
          color = "blue"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = var.app_version_blue
          port {
            container_port = 80
          }
        }
      }
    }
  }
}