resource "yandex_kubernetes_cluster" "netology_k8s" {
  name        = var.kubernetes.mycluster.name
  network_id  = yandex_vpc_network.network.id
  cluster_ipv4_range = var.kubernetes.mycluster.clusternet
  service_ipv4_range = var.kubernetes.mycluster.servicenet

  master {
    regional {
      region = "ru-central1"
      dynamic "location" {
        for_each = yandex_vpc_subnet.public_subnets
        content {
          zone      = location.value.zone
          subnet_id = location.value.id
        }
      }
    }
    version   = var.kubernetes.mycluster.version
    public_ip = var.kubernetes.mycluster.public_ip
  }

  service_account_id      = yandex_iam_service_account.k8s-svc.id
  node_service_account_id = yandex_iam_service_account.k8s-svc.id

  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }

depends_on = [yandex_iam_service_account.k8s-svc]

}


resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  folder_id = var.cloud.netology.folder_id
  role      = var.kubernetes-key.mycluster.role
  member    = "serviceAccount:${yandex_iam_service_account.k8s-svc.id}"
}

