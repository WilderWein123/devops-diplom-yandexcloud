### cloud vars

resource "yandex_kms_symmetric_key" "kms-key" {
  name              = var.kubernetes-key.mycluster.name
  default_algorithm = var.kubernetes-key.mycluster.algorythm
  rotation_period   = var.kubernetes-key.mycluster.expired
}


#kube_service_account
variable "service_account_name" {
  type        = string
  default     = "k8s-svc"
  description = "Сервисный аккаунт для кластера Kubernetes"
}

#kube_output config path
variable "kube_config" {
  type    = string
  default = "/home/seregin/scripts/devops-diplom-yandexcloud/devops-diplom-yandexcloud/private/config"
}

