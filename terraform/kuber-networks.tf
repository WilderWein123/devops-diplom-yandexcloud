resource "yandex_vpc_network" "kuber" {}

resource "yandex_vpc_subnet" "kuber-a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.kuber.id
  v4_cidr_blocks = ["10.4.99.0/24"]
}

resource "yandex_vpc_subnet" "kuber-b" {
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.kuber.id
  v4_cidr_blocks = ["10.4.98.0/24"]
}

resource "yandex_vpc_subnet" "kuber-d" {
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.kuber.id
  v4_cidr_blocks = ["10.4.97.0/24"]
}