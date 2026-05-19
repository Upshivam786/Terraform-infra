module "vms" {
  source = "../../../modules/vm"

  for_each = var.vms

  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  image        = each.value.image
  network      = each.value.network
  subnetwork   = each.value.subnetwork
  disk_size    = each.value.disk_size
  tags         = each.value.tags
  startup_script = each.value.startup_script
}
