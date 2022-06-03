provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Create the storageClass
resource "helm_release" "nfs_client" {
  name = "nfs-sc"
  repository = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/"
  chart = "nfs-subdir-external-provisioner"
  namespace = "kube-public"
  set {
    name = "nfs.server"
    value= "pihole"
  }
  set {
    name = "nfs.path"
    value= "/nfs"
  }
  set {
    name = "nfs.mountOptions[0]"
    value= "nfsvers=4"
  }
  set {
    name = "storageClass.accessModes"
    value= "ReadWriteMany"
  }
}
