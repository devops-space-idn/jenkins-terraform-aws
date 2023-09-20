resource "aws_security_group" "allow_ssh" {
#   vpc_id      = aws_vpc.belajar_vpc.id
  vpc_id      = var.vpc_id
  name        = "blj-sg-ssh"
  description = "Security group that allow ssh and all egress traffic"
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
    Name = "blj-sg-ssh"
  }
}

resource "aws_security_group" "jenkins_web" {
  vpc_id      = var.vpc_id
  name        = "blj-sg-jenkins-web"
  description = "Security group that allow TCP ingress traffic to jenkins web app"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.jenkins_cidr_whitelist
  }

  tags = {
    Name = "blj-sg-jenkins-web"
  }
}

resource "aws_key_pair" "belajar_key" {
  key_name   = "belajar-key"
  public_key = var.ssh_public_key
}

resource "aws_instance" "belajar_jenkins" {
  ami           = "ami-0df7a207adb9748c7"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.belajar_key.key_name
  security_groups = [
    aws_security_group.allow_ssh.id,
    aws_security_group.jenkins_web.id
  ]
  user_data = file("${path.module}/install-jenkins.sh")

  tags = {
    Name = "belajar_jenkins"
  }
}

data "aws_route53_zone" "devops-space" {
  name = "devops-space.my.id"
}

resource "aws_route53_record" "jenkins_record" {
  zone_id = data.aws_route53_zone.devops-space.zone_id
  name    = "jenkins.${data.aws_route53_zone.devops-space.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.belajar_jenkins.public_ip]
}