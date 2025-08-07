resource "yandex_kubernetes_cluster" "netology_k8s" {
  name        = var.kubernetes.mycluster.name
  network_id  = yandex_vpc_network.kuber.id
  cluster_ipv4_range = var.kubernetes.mycluster.clusternet
  service_ipv4_range = var.kubernetes.mycluster.servicenet

  master {
    regional {
      region = var.kubernetes.mycluster.region
      location {
        zone      = yandex_vpc_subnet.kuber-a.zone
        subnet_id = yandex_vpc_subnet.kuber-a.network_id
      }
      location {
        zone      = yandex_vpc_subnet.kuber-b.zone
        subnet_id = yandex_vpc_subnet.kuber-b.network_id
      }
      location {
        zone      = yandex_vpc_subnet.kuber-d.zone
        subnet_id = yandex_vpc_subnet.kuber-d.network_id
      }
    }
    version   = var.kubernetes.mycluster.version
    public_ip = var.kubernetes.mycluster.public_ip
  }

  service_account_id      = yandex_iam_service_account.kuber.id
  node_service_account_id = yandex_iam_service_account.kuber.id

  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  folder_id = var.cloud.netology.folder_id
  role      = var.kubernetes-key.mycluster.role
  member    = "serviceAccount:${yandex_iam_service_account.kuber.id}"
}


resource "yandex_kms_symmetric_key" "kms-key" {
  name              = var.kubernetes-key.mycluster.name
  default_algorithm = var.kubernetes-key.mycluster.algorythm
  rotation_period   = var.kubernetes-key.mycluster.expired
}

resource "yandex_iam_service_account" "kuber" {
  name        = var.kubernetes.mycluster.name
  description = "Service account for the highly available Kubernetes cluster"
}