resource "aws_vpc" "demovpc-1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_internet_gateway" "demoigw" {
  vpc_id = aws_vpc.demovpc-1.id
  tags = {
    "Name" = "Dev-IGW"
  }
}

resource "aws_subnet" "demosubnet-1" {
  vpc_id                  = aws_vpc.demovpc-1.id
  cidr_block              = var.cidr_subnet_1
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.subnet_1_name
  }
}
resource "aws_subnet" "demosubnet-2" {
  vpc_id                  = aws_vpc.demovpc-1.id
  cidr_block              = var.cidr_subnet_2
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.subnet_2_name
  }
}