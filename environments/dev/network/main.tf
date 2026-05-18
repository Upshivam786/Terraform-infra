module "vpc" {
  source = "../../../modules/vpc"

  vpc_name    = "dev-vpc"
  subnet_name = "dev-subnet"
  cidr        = "10.10.0.0/24"
  region      = var.region
}
