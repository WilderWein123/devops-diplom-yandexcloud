resource "local_file" "kubeconfig" {
  filename = var.kube_config
  content = templatefile("${path.module}/kubeconfig.tpl", {
    endpoint       = yandex_kubernetes_cluster.netology_k8s.master[0].external_v4_endpoint
    cluster_ca     = base64encode(yandex_kubernetes_cluster.netology_k8s.master[0].cluster_ca_certificate)
    k8s_cluster_id = yandex_kubernetes_cluster.netology_k8s.id
  })
}