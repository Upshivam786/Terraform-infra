resource "google_compute_image" "image" {
  name            = var.image_name
  source_disk     = var.source_disk
}
