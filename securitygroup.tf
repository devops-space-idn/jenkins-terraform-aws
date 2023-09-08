resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_vpc.belajar_vpc.id
  name        = "blj-allow-ssh"
  description = "security group that allow ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["36.69.0.0/16"]
  }

  tags = {
    Name = "blj-allow-ssh"
  }
}
