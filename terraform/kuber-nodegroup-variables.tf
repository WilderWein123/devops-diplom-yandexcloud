variable "node_group_vm" {
  type = list(object({
    cores               = number
    memory              = number
    core_fraction       = number
    disk_size           = number
    disk_type           = string
    container_runtime   = string
    preemptible         = bool
    nat                 = bool
    default_zone        = string
    platform_id         = string
    scale_count_initial = number
    scale_count_min     = number
    scale_count_max     = number
  }))
  default = [{
    cores               = 2
    memory              = 2
    core_fraction       = 20
    disk_size           = 30
    disk_type           = "network-hdd"
    container_runtime   = "containerd"
    preemptible         = true
    nat                 = true
    default_zone        = "ru-central1-a"
    platform_id         = "standard-v3"
    scale_count_initial = 1
    scale_count_min     = 1
    scale_count_max     = 2
  }]
}