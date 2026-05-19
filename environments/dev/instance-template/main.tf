module "template" {
  source = "../../../modules/instance_template"

  name_prefix  = "dev-template"
  machine_type = var.machine_type
  image        = var.image
  network      = var.network
  subnetwork   = var.subnetwork
  tags         = var.tags
}
