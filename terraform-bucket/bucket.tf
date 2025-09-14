// Create service account
resource "yandex_iam_service_account" "netology-tfstate-user" {
  folder_id = var.cloud.netology.folder_id
  name      = var.bucket.tfstate.bucketuser
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "netology-tfstate-user" {
  folder_id = var.cloud.netology.folder_id
  role      = var.bucket.tfstate.role
  member    = "serviceAccount:${yandex_iam_service_account.netology-tfstate-user.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "tfstate-user-static-key" {
  service_account_id = yandex_iam_service_account.netology-tfstate-user.id
}

// Create encryprion key
resource "yandex_kms_symmetric_key" "encryptkey" {
 name              = var.bucket.tfstate.keyname
 default_algorithm = var.bucket.tfstate.keyalgorythm
 rotation_period   = var.bucket.tfstate.keyexpired
}

resource "yandex_storage_bucket" "diplomtfstate" {
  access_key = yandex_iam_service_account_static_access_key.tfstate-user-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.tfstate-user-static-key.secret_key
  bucket     = var.bucket.tfstate.bucketname
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.encryptkey.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
#  versioning {
#    enabled = var.bucket.tfstate.versioning
#  }

  provisioner "local-exec" {
    command = "echo ${yandex_iam_service_account_static_access_key.tfstate-user-static-key.access_key} > ../private/terraform-access-key.txt"
  }

  provisioner "local-exec" {
    command = "echo ${yandex_iam_service_account_static_access_key.tfstate-user-static-key.secret_key} > ../private/terraform-secret-key.txt"
  }
}

