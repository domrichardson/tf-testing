resource "tls_private_key" "key" {
  algorithm = "ED25519"
}

resource "local_file" "TF_Key" {
  content  = tls_private_key.key.private_key_openssh
  filename = "tf-key"
}

resource "local_file" "TF_Key_Public" {
  content  = tls_private_key.key.public_key_openssh
  filename = "tf-key.pub"
}

resource "aws_key_pair" "DR_TF_Key" {
  key_name   = "DR_TF_Key"
  public_key = local_file.TF_Key_Public.content
}
