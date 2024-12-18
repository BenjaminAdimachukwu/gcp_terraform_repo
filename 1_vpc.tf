resource "google_compute_network" "vpc_network" {
  project                 = "zenithclouddevops"
  name                    = "hippa-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}