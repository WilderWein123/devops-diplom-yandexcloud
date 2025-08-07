resource "yandex_kubernetes_node_group" "main_nodes" {
  cluster_id = yandex_kubernetes_cluster.netology_k8s.id
  name       = var.kubernetes-nodes.nodegroup.name
  version    = var.kubernetes.mycluster.version

  scale_policy {
    auto_scale {
      min     = var.kubernetes-nodes.nodegroup.autoscalemin
      max     = var.kubernetes-nodes.nodegroup.autoscalemax
      initial = var.kubernetes-nodes.nodegroup.autoscaleinit
    }
  }

  allocation_policy {
    location {
      zone = var.kubernetes.mycluster.region
    }
  }

  instance_template {
    platform_id = var.kubernetes-nodes.nodegroup.platform_id
    network_interface {
      subnet_ids = [yandex_vpc_subnet.kuber-a.id]
      nat = var.kubernetes-nodes.nodegroup.nat
    }

    metadata = {
      ssh-keys = var.ssh_key
    }

    resources {
      cores  = var.kubernetes-nodes.nodegroup.nodecpu
      core_fraction = var.kubernetes-nodes.nodegroup.nodecorefraction
      memory = var.kubernetes-nodes.nodegroup.noderam
    }

    boot_disk {
      type = var.kubernetes-nodes.nodegroup.nodehddtype
      size = var.kubernetes-nodes.nodegroup.nodehddsize
    }

    scheduling_policy {
      preemptible = var.kubernetes-nodes.nodegroup.preemptible
    }
  }
}