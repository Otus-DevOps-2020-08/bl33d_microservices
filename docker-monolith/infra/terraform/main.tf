provider "yandex" {
    service_account_key_file = "terraform-bot-key.json.example"
    cloud_id = var.cloud_id
    folder_id = var.folder_id
    zone = var.zone
}

resource "yandex_compute_instance" "docker-host" {
    count = var.host_count
    name = "docker-host-0${count.index}"

    resources {
    cores  = 2
    memory = 2
    }

    metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
    }

    boot_disk {
        initialize_params {
        image_id = var.image_id
        size = 15
        }
    }

    network_interface {
        subnet_id = var.subnet_id
        nat       = true
    }
}
