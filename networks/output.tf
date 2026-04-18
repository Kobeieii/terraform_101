output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "sub_vpc_network_name" {
  value = google_compute_subnetwork.sub_vpc_network.name
}