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
    cidr_blocks = var.ssh_cidr_whitelist
  }

  tags = {
    Name = "blj-allow-ssh"
  }
}

resource "aws_security_group" "jenkins_web" {
  vpc_id      = aws_vpc.belajar_vpc.id
  name        = "blj-sg-jenkins-web"
  description = "security group that allow tcp ingress traffic to port 8080"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.jenkins_cidr_whitelist
  }

  tags = {
    Name = "blj-allow-tcp-8080"
  }
}