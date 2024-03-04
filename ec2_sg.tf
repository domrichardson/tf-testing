
resource "aws_security_group" "DR_TF_SG" {
  name        = "DR_TF_SG"
  description = "Dom Terraform SG"
  vpc_id      = "vpc-06d886f059cc53d16"

  tags = {
    Name = "DR_TF_SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.DR_TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  #cidr_ipv6         = "::/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
  description = "HTTPS"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.DR_TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  #cidr_ipv6         = "::/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  description = "HTTP"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.DR_TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  #cidr_ipv6         = "::/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  description = "SSH"
}

resource "aws_vpc_security_group_ingress_rule" "tentacle" {
  security_group_id = aws_security_group.DR_TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  #cidr_ipv6         = "::/0"
  from_port   = 10933
  ip_protocol = "tcp"
  to_port     = 10933
  description = "Octopus Tentacle"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.DR_TF_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  #cidr_ipv6         = "::/0"
  ip_protocol = "-1" # semantically equivalent to all ports
}
