###cloud vars
variable bucket {
  type = map(object({
    bucketname = string
    bucketuser = string
    role = string
    keyname = string
    keyalgorythm = string
    keyexpired = string
    versioning = bool
  }))
    default = {
      "tfstate" = {
        bucketname = "diplomtfstate"
        bucketuser = "netology-tfstate-user"
        role = "storage.admin"
        keyname = "encryptkey"
        keyalgorythm = "AES_256"
        keyexpired = "8760h"
        versioning = "true"
      }
    }
}