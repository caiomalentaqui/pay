provider "kubernetes" {
    config_path    = "~/.kube/config"
    config_context = "kind-pay"
}

resource "kubernetes_namespace_v1" "pay_platform" {
    metadata {
      name = "pay-infrastructure"
    }  
}

resource "kubernetes_namespace_v1" "messaging-ingestion" {
    metadata {
      name = "messaging-ingestion"
    }  
}

resource "kubernetes_namespace_v1" "messaging-storage" {
    metadata {
      name = "messaging-storage"
    }  
}

resource "kubernetes_deployment_v1" "nginx_test" {
  metadata {
    name      = "nginx-test"
    namespace = kubernetes_namespace_v1.pay_platform.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
        }
      }
    }
  }
}

