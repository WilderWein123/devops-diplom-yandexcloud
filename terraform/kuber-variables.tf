###cloud vars

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
      clusternet = "10.1.0.0/16"
      servicenet = "10.2.0.0/16"
      region = "ru-central1-a"
      version = "1.29"
      public_ip = true
    }
  }
}

variable kubernetes-nodes {
  type = map(object({
    name = string
    autoscalemin = number
    autoscalemax = number
    autoscaleinit = number
    platform_id = string
    nat = bool
    nodecpu = number
    nodecorefraction = number
    noderam = number
    nodehddtype = string
    nodehddsize = number
    preemptible = bool
  }))
  default = {
    "nodegroup" = {
      name = "main-nodegroup"
      autoscalemin = 3
      autoscalemax = 3
      autoscaleinit = 3
      platform_id = "standard-v2"
      nat = true
      nodecpu = 2
      nodecorefraction = 5
      noderam = 2
      nodehddtype = "network-ssd"
      nodehddsize = 10
      preemptible = true
    }
  }
}

