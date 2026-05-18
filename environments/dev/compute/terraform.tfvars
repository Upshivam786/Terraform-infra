project_id = "bluet-terra"
region     = "asia-south1"

vms = {
  test1 = {
    name         = "test1"
    machine_type = "e2-micro"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 10
    tags         = ["test"]
  }

  test2 = {
    name         = "test2"
    machine_type = "e2-micro"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 10
    tags         = ["test"]
  }

  test3 = {
    name         = "test3"
    machine_type = "e2-micro"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 10
    tags         = ["test"]
  }
}