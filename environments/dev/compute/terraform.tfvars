project_id            = "bluet-terra"
region                = "asia-south1"
service_account_email = "api-service-account@bluet-terra.iam.gserviceaccount.com"
ssh_user              = "shivam_u"
ssh_public_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINIcs5SheKl6R9oN0W8X+HMmIGwlFVrYgID8YUk99Bma bitbucket-deploy"

vms = {
  test1 = {
    name         = "test1"
    machine_type = "e2-micro"
    zone         = "asia-south1-a"
    image        = "debian-cloud/debian-12"
    network      = "dev-vpc"
    subnetwork   = "dev-subnet"
    disk_size    = 10
    tags         = ["http-server"]
    startup_script = <<-EOT
      #!/bin/bash
      apt-get update -y
      apt-get install -y docker.io google-cloud-sdk
      systemctl enable docker
      systemctl start docker
      gcloud auth configure-docker asia-south1-docker.pkg.dev --quiet
    EOT
  }
}
