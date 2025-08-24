variable kubernetes-key {
  type = map(object({
    name = string
    role = string
    algorythm = string
    expired = string
  }))
  default = {
    "mycluster" = {
      name = "kuber-key"
      role = "k8s.admin"
      algorythm = "AES_128"
      expired = "8760h"
    }
  }
}