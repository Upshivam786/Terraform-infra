variable "project_id" {}
variable "region" {}

variable "vms" {
  type = map(object({
    name         = string
    machine_type = string
    zone         = string
    image        = string
    network      = string
    subnetwork   = string
    disk_size    = number
    tags         = list(string)
    startup_script = string
  }))
}
