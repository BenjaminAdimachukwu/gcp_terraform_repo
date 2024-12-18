
resource "google_compute_instance" "terraformvm" {
  name         = "terraform-vm"
  machine_type = "n2-standard-2"
  zone         = "africa-south1-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.network-with-private-secondary-ip-ranges.self_link

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "web"
  }

  metadata_startup_script = "sudo apt install nginx -y"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "pipeline-action@zenithclouddevops.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}