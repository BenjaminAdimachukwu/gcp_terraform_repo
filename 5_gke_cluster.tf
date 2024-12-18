resource "google_container_cluster" "gke_cluster" {
  name     = "zenith_cluster"
  location = "africa-south1"

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
  }

  initial_node_count = 3
  network            = google_compute_network.vpc_network.id
}
