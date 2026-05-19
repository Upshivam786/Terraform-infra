module "lb" {
  source = "../../../modules/load_balancer"

  name           = "dev-lb"
  instance_group = var.instance_group
}
