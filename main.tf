module "k8s" {
  source = "./k8s"

  namespace          = var.namespace
  app_version_blue   = var.app_version_blue
  app_version_green  = var.app_version_green
}