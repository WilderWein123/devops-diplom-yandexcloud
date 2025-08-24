terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "diplom-bucket"
    region = "ru-central1"
    key    = ".tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}


provider "yandex" {
  service_account_key_file = "/home/seregin/scripts/devops-diplom-yandexcloud/devops-diplom-yandexcloud/private/for_kubernetes_cluster.json"
  cloud_id                 = var.cloud.netology.cloud_id
  folder_id                = var.cloud.netology.folder_id
  zone                     = var.cloud.netology.default_zone
}

