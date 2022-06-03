provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "mongodb_pvc" {
  name = "mongodb-pvc"
  repository = "bitnami"
  chart = "bitnami/mongodb"
  namespace = "kube-public"
  values = [
    templatefile("values.yaml", {})
  ]
}
