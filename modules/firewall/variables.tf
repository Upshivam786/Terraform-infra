variable "firewall_rules" {
  type = map(object({
    name          = string
    network       = string
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
    target_tags   = list(string)
  }))
}
