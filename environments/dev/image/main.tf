module "image" {
  source = "../../../modules/image"

  image_name = var.image_name
  source_disk = var.source_disk
  zone        = var.zone
}
