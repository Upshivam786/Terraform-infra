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
    # No access_config → no public IP on MIG VMs
  }

  tags = var.tags

  metadata = {
    startup-script = var.startup_script
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
