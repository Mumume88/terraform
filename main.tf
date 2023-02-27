terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
    token     = "token"
    folder_id = "folder"
    zone      = "ru-central1-a"
  }
#Создаем целевую группу
resource "yandex_lb_target_group" "foo" {
  name      = "my-target-group"

  target {
    subnet_id = "folder"
    address   = "192.168.10.11"
  }

  target {
    subnet_id = "folder"
    address   = "192.168.10.30"
  }

}
#Создаем балансировщик
resource "yandex_lb_network_load_balancer" "internal-lb-test" {
  name = "external-lb-test"
  type = "external"
  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
 
 


