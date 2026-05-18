project_id = "YOUR_PROJECT_ID"
region     = "asia-south1"

vms = {
  api = {
    name         = "dev-api"
    machine_type = "e2-medium"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 30
    tags         = ["api"]
  }

  kafka = {
    name         = "dev-kafka"
    machine_type = "e2-standard-2"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 100
    tags         = ["kafka"]
  }

  clickhouse = {
    name         = "dev-clickhouse"
    machine_type = "e2-standard-4"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 200
    tags         = ["clickhouse"]
  }
}
