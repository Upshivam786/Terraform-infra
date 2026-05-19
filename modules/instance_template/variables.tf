variable "name_prefix" {}
variable "machine_type" {}
variable "image" {}
variable "network" {}
variable "subnetwork" {}

variable "tags" {
  type = list(string)
}
