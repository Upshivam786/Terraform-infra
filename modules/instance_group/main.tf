resource "google_compute_region_instance_group_manager" "mig" {
  name   = var.name
  region = var.region

  version {
    instance_template = var.instance_template
  }

  base_instance_name = var.base_instance_name
  target_size        = var.target_size

  named_port {
    name = "http"
    port = 80
  }
}
