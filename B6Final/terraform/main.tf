terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
  backend "s3" {
    bucket     = "fun"
    key        = "terraform/B5-6.tfstate"
    region     = "ru-central1-a"
    endpoint   = "storage.yandexcloud.net"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = ""
  cloud_id  = ""
  folder_id = ""
  zone      = "ru-central1-a"

}

resource "yandex_vpc_network" "vpc1" {
  name = "vpc1"
}

resource "yandex_vpc_subnet" "net1" {
  name           = "net1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.vpc1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

module "vm_create" {
  source = "./modules/ya-vm-create"

  vpc_subnet_id         = yandex_vpc_subnet.net1.id
  cc_image      = "ubuntu-2004-lts"
  cc_name       = "vm1"
  cc_nat  = true
}

module "vm_create_2" {
  source = "./modules/ya-vm-create"

  vpc_subnet_id         = yandex_vpc_subnet.net1.id
  cc_image      = "ubuntu-2004-lts"
  cc_name       = "vm2"
  cc_nat  = false
}

module "vm_create_3" {
  source = "./modules/ya-vm-create"

  vpc_subnet_id         = yandex_vpc_subnet.net1.id
  cc_image      = "centos-7"
  cc_name       = "vm3"
  cc_nat  = false
}

