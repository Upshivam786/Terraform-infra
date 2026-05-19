module "mig" {
  source = "../../../modules/instance_group"

  name               = "dev-mig"
  region             = var.region
  instance_template  = var.instance_template
  base_instance_name = "dev-instance"
  target_size        = var.target_size
}
