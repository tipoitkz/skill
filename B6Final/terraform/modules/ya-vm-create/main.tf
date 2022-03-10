terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

data "yandex_compute_image" "lemp_image" {
  family = var.cc_image
} 

resource "yandex_compute_instance" "vm" {
  name = var.cc_name

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.lemp_image.id}"
      size = 20
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat = var.cc_nat
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

