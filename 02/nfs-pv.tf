provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_persistent_volume" "nfs-pv" {
  metadata {
    name = "nfs-pv"
  }
  spec {
    capacity = {
      storage = "8Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      nfs {
        server = "pihole"
        path   = "/nfs"
      }
    }
  }
}
