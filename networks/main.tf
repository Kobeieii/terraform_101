resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "sub_vpc_network" {
  project       = var.project_id
  name          = "sub-vpc-network"
  ip_cidr_range = "10.2.0.0/16"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "sub-vpc-secondary-range"
    ip_cidr_range = "192.168.10.0/24"
  }
  depends_on = [google_compute_network.vpc_network]
}

resource "google_compute_firewall" "rules" {
  project     = var.project_id
  name        = "ts-firewall-rule"
  network     = google_compute_network.vpc_network.name
  description = "For test purposes only"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
