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

variable "ssh_key" {
  type        = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5YomKL8licFR1heO5WoZl9K8lztjhLWOrXTJW9/nHVJv2hEcSHrmKxqjhwNv/JA1MKfiK/vwLPsFD5608945IUl+psM4Bnak7esZrvPg/rinz2jvxCwP6f/n6n4pMQemikCuVXvCXlJjDVkjT4DDVSuZ7BiStHT+DH1xFzxP+0aZ+lUjHB21UhtiGLlJHav4F2K3uAl7S9n7ufaAUFZEpx3zRlHlryQuxldHkMq3Hgu4JkxzmYGoUvAL0/emfsZn7PUWVUlpHqo98ii4e6SVIMy63vpcudjAIq4ht+veQbJbOTQ7127Obc+6jfBgpXDZCcM6PUAILyEmtTHfdSI9D"
}
