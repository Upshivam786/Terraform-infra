variable "project_id" {}
variable "region" {}
variable "service_account_email" {}
variable "ssh_user" {}
variable "ssh_public_key" {}
variable "vms" {
  type = map(object({
    name           = string
    machine_type   = string
    zone           = string
    image          = string
    network        = string
    subnetwork     = string
    disk_size      = number
    tags           = list(string)
    startup_script = string
  }))
}
