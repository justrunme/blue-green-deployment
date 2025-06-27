

resource "kubernetes_service" "app_service" {
  metadata {
    name      = "app-svc"
    namespace = var.namespace
  }

  spec {
    selector = {
      app   = "app"
      color = "green" # Change to "blue" for rollback
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}

output "service_name" {
  value = kubernetes_service.app_service.metadata[0].name
}