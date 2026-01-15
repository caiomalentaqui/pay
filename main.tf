provider "kubernetes" {
    config_path    = "~/.kube/config"
    config_context = "kind-pay"
}

resource "kubernetes_namespace_v1" "pay_platform" {
    metadata {
      name = "pay-infrastructure"
    }  
}