variable "namespace" {
  type    = string
  default = "bluegreen"
}

variable "app_version_blue" {
  type    = string
  default = "nginx:1.25.0"
}

variable "app_version_green" {
  type    = string
  default = "nginx:1.25.2"
}