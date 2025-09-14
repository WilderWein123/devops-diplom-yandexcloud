terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.147.0"
    }
  }
}


provider "yandex" {
  service_account_key_file = "/home/seregin/scripts/devops-diplom-yandexcloud/devops-diplom-yandexcloud/private/for_storage_editor.json"
  cloud_id                 = var.cloud.netology.cloud_id
  folder_id                = var.cloud.netology.folder_id
  zone                     = var.cloud.netology.default_zone
}

