resource "google_compute_firewall" "rules" {
  for_each = var.firewall_rules

  name    = each.value.name
  network = each.value.network

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
}
