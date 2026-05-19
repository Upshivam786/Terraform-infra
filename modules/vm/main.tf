resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  
  metadata_startup_script = var.startup_script  

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {}
  }

  tags = var.tags
}
