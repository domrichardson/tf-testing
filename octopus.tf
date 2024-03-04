
resource "octopusdeploy_ssh_key_account" "ssh-account" {
  name                   = "TF-SSH-Key"
  private_key_file       = "RandomText"
  private_key_passphrase = base64encode(tls_private_key.key.private_key_openssh)
  username               = "ubuntu"
}

resource "octopusdeploy_ssh_connection_deployment_target" "od-ssh-target" {
  name         = "TF-SSH-EC2"
  fingerprint  = ssh_resource.get_fingerprint.result
  host         = aws_instance.DR-TF-EC2.public_ip
  port         = 22
  environments = ["Environments-1203"]
  account_id   = octopusdeploy_ssh_key_account.ssh-account.id
  roles        = ["AWS-EC2"]
}
