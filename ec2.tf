resource "aws_instance" "DR-TF-EC2" {
  ami             = var.instance_image
  instance_type   = var.instance_type
  security_groups = [aws_security_group.DR_TF_SG.name]
  key_name        = aws_key_pair.DR_TF_Key.key_name

  user_data = file("script.sh")

  tags = {
    Name = "dr-tf-test"
  }
}

resource "ssh_resource" "get_fingerprint" {
  host        = aws_instance.DR-TF-EC2.public_ip
  private_key = tls_private_key.key.private_key_pem
  depends_on  = [aws_instance.DR-TF-EC2]
  user        = "ubuntu"
  commands = [
    "sudo ssh-keygen -E md5 -lf /etc/ssh/ssh_host_ed25519_key.pub | cut -d' ' -f2 | awk '{ print $1}' | cut -d':' -f2-"
  ]
}
