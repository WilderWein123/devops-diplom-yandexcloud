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
}

#kube_output config path
variable "kube_config" {
  type    = string
  default = "/home/seregin/scripts/devops-diplom-yandexcloud/devops-diplom-yandexcloud/private/config"
}

variable kubernetes {
  type = map(object({
    name = string
    clusternet = string
    servicenet = string
    region = string
    version = string
    public_ip = bool
  }))
  default = {
    "mycluster" = {
      name = "netology-k8s-cluster"
      clusternet = "10.95.0.0/16"
      servicenet = "10.94.0.0/16"
      region = "ru-central1-a"
      version = "1.29"
      public_ip = true
    }
  }
}