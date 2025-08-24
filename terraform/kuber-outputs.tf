output "cluster_id" {
  value = try(yandex_kubernetes_cluster.netology_k8s.id, null)
}

output "cluster_name" {
  value = try(yandex_kubernetes_cluster.netology_k8s.name, null)
}

output "external_v4_address" {
  value = yandex_kubernetes_cluster.netology_k8s.master[0].external_v4_address
}

output "external_cluster_cmd" {
  value = "yc managed-kubernetes cluster get-credentials --id ${yandex_kubernetes_cluster.netology_k8s.id} --external"
}