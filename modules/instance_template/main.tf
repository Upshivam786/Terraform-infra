resource "google_compute_instance_template" "template" {
  name_prefix  = var.name_prefix
  machine_type = var.machine_type

  disk {
    boot         = true
    auto_delete  = true
    source_image = var.image
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {}
  }

  tags = var.tags
}
