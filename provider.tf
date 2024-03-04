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
}

provider "octopusdeploy" {
  address  = var.octopus_server
  api_key  = var.octopus_apikey
  space_id = var.octopus_spaceid
}
