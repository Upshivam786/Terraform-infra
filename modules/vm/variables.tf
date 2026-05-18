variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "image" {}
variable "network" {}
variable "subnetwork" {}
variable "disk_size" {}

variable "tags" {
  type = list(string)
}
