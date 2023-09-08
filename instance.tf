resource "aws_key_pair" "belajar_key" {
  key_name   = "belajar-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "belajar_jenkins" {
  ami             = "ami-0df7a207adb9748c7"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.belajar_public_1.id
  key_name        = aws_key_pair.belajar_key.key_name
  security_groups = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "belajar_jenkins"
  }
}
