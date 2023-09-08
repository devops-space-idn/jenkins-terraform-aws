resource "aws_vpc" "belajar_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "belajar-vpc"
  }
}

resource "aws_subnet" "belajar_public_1" {
  vpc_id = aws_vpc.belajar_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "belajar-public-1"
  }
}

resource "aws_internet_gateway" "belajar_igw" {
  vpc_id = aws_vpc.belajar_vpc.id
  tags = {
    Name = "belajar-igw"
  }
}

resource "aws_route_table" "blj_public_route_table" {
  vpc_id = aws_vpc.belajar_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.belajar_igw.id
  }  

  tags = {
    Name = "belajar-public-rt"
  }
}

resource "aws_route_table_association" "belajar_public_rta" {
  subnet_id = aws_subnet.belajar_public_1.id
  route_table_id = aws_route_table.blj_public_route_table.id
}