variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "image" {}
variable "network" {}
variable "subnetwork" {}
variable "disk_size" {}
variable "tags" { type = list(string) }
variable "startup_script" { default = "" }
variable "static_ip" { default = null }
variable "service_account_email" { default = "" }
variable "ssh_user" { default = "" }
variable "ssh_public_key" { default = "" }
