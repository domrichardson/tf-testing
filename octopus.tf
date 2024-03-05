
resource "octopusdeploy_ssh_key_account" "ssh-account" {
  name                   = "${var.octopus_target_name}_KEY"
  private_key_file       = "RandomText"
  private_key_passphrase = base64encode(tls_private_key.key.private_key_openssh)
  username               = "ubuntu"
}

resource "octopusdeploy_ssh_connection_deployment_target" "od-ssh-target" {
  name                  = "${var.octopus_target_name}_TARGET"
  fingerprint           = ssh_resource.get_fingerprint.result
  host                  = aws_instance.DR-TF-EC2.public_ip
  port                  = 22
  environments          = ["Environments-1203"]
  account_id            = octopusdeploy_ssh_key_account.ssh-account.id
  roles                 = ["AWS-EC2"]
  dot_net_core_platform = "linux-x64"
}
