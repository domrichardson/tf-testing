variable "octopus_server" {
  type = string
}

variable "octopus_apikey" {
  type = string
}

variable "octopus_spaceid" {
  type = string
}

variable "octopus_target_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_image" {
  type    = string
  default = "ami-0d18e50ca22537278"
}
