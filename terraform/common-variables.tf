###cloud vars

variable cloud {
  type = map(object({
    cloud_id = string
    folder_id = string
    default_zone = string
    vpc_name = string
  }))
    default = { 
      "netology" = {
        cloud_id = "dn233vdl3pdu43936vpg"
        folder_id = "b1gj6ia0559mol9ufg9k"
        default_zone = "ru-central1-a"
        vpc_name = "netology-diplom"
      }
  }
}
