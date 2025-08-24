resource "yandex_iam_service_account" "k8s-svc" {
  name        = var.service_account_name
  description = "kuber-k8s-svc"
}

#we need editor role to get access to tfstate bucket
resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = var.cloud.netology.folder_id
  role      = "editor"
  members   = ["serviceAccount:${yandex_iam_service_account.k8s-svc.id}"]
}

#we need cluster.agent role to get access to cluster
resource "yandex_resourcemanager_folder_iam_binding" "k8s_agent" {
  folder_id = var.cloud.netology.folder_id
  role      = "k8s.clusters.agent"
  members   = ["serviceAccount:${yandex_iam_service_account.k8s-svc.id}"]
}

#we need vpc.admin role to create networks
resource "yandex_resourcemanager_folder_iam_binding" "vpc_admin" {
  folder_id = var.cloud.netology.folder_id
  role      = "vpc.publicAdmin"
  members   = ["serviceAccount:${yandex_iam_service_account.k8s-svc.id}"]
}

#we need k8s.admin role to create cluster
resource "yandex_resourcemanager_folder_iam_binding" "k8s_admin" {
  folder_id = var.cloud.netology.folder_id
  role      = "k8s.admin"
  members   = ["serviceAccount:${yandex_iam_service_account.k8s-svc.id}"]
}

#we need service eky to service account
resource "yandex_iam_service_account_key" "k8s-svc-key" {
  service_account_id = yandex_iam_service_account.k8s-svc.id
  description        = "K8S SA key for Terraform"
  key_algorithm      = "RSA_4096"
}