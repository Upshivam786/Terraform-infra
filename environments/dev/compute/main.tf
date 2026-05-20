# Reserve static external IP
resource "google_compute_address" "vm_static_ip" {
  name   = "dev-vm-static-ip"
  region = var.region
}

module "vms" {
  source   = "../../../modules/vm"
  for_each = var.vms

  name                  = each.value.name
  machine_type          = each.value.machine_type
  zone                  = each.value.zone
  image                 = each.value.image
  network               = each.value.network
  subnetwork            = each.value.subnetwork
  disk_size             = each.value.disk_size
  tags                  = each.value.tags
  startup_script        = each.value.startup_script
  static_ip             = google_compute_address.vm_static_ip.address
  service_account_email = var.service_account_email
  ssh_user              = var.ssh_user
  ssh_public_key        = var.ssh_public_key
}

output "static_ip" {
  value = google_compute_address.vm_static_ip.address
}

output "vm_external_ips" {
  value = { for k, v in module.vms : k => v.external_ip }
}
