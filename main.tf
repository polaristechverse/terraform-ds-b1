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
  depends_on = [aws_vpc.demovpc-1]
}