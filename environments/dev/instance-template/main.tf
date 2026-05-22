module "template" {
  source = "../../../modules/instance_template"

  name_prefix           = "dev-template"
  machine_type          = var.machine_type
  image                 = var.image
  network               = var.network
  subnetwork            = var.subnetwork
  tags                  = var.tags
  startup_script        = var.startup_script
  service_account_email = var.service_account_email
}

output "template_self_link" {
  value = module.template.template_self_link
}
