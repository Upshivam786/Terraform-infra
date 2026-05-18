module "firewall" {
  source = "../../../modules/firewall"

  firewall_rules = var.firewall_rules
}
