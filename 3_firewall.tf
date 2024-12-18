resource "google_compute_firewall" "default" {
  name    = "terraform-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80","22","443", "1000-2000"]
  }

  source_tags = ["web"]
}

