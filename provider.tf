provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
    ssh = {
      source = "loafoe/ssh"
    }
  }
  backend "s3" {
    bucket = "domrichardson-s3"
    key    = "tf-state/terraform.state"
    region = "eu-west-2"
  }
}

provider "octopusdeploy" {
  address  = var.octopus_server
  api_key  = var.octopus_apikey
  space_id = var.octopus_spaceid
}
