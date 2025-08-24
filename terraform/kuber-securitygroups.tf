resource "yandex_vpc_security_group" "regional-k8s-sg" {
  name        = "regional-k8s-sg"
  network_id  = yandex_vpc_network.network.id
  folder_id   = var.cloud.netology.folder_id
  ingress {
    protocol          = "TCP"
    description       = "lb -> kubernetes cluster"
    predefined_target = "loadbalancer_healthchecks"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol          = "ANY"
    description       = "kubernetes master -> host and host -> host"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol       = "ANY"
    description    = "kubernetes internal"
    v4_cidr_blocks = flatten(yandex_vpc_subnet.public_subnets[*].v4_cidr_blocks)
    from_port      = 0
    to_port        = 65535
  }
  ingress {
    protocol       = "ICMP"
    description    = "ping debug"
    v4_cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }
  ingress {
    protocol       = "TCP"
    description    = "kuber client access"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 30000
    to_port        = 32767
  }
  ingress {
    protocol       = "TCP"
    description    = "kubernetes apiserver"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 6443
  }
  ingress {
    protocol       = "TCP"
    description    = "kubernetes api"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }
  egress {
    protocol       = "ANY"
    description    = "out allow all"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}