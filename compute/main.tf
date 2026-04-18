resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-medium"
  zone         = "asia-southeast1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2510-amd64"
      labels = {
        my_label = "value"
      }
    }
  }


  network_interface {
    network = var.vpc_network_name
    subnetwork = var.sub_vpc_network_name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = [ "cloud-platform" ]
  }
}
