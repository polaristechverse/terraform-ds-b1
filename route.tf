resource "aws_route_table" "demoroute" {
  vpc_id = aws_vpc.demovpc-1.id
  tags = {
    "Name" = var.route_name
  }
  route {
    gateway_id = aws_internet_gateway.demoigw.id
    cidr_block = "0.0.0.0/0"
  }
  depends_on = [aws_subnet.demosubnet-3]
}

resource "aws_route_table_association" "demorouteassoicate-1" {
  route_table_id = aws_route_table.demoroute.id
  subnet_id      = aws_subnet.demosubnet-1.id
}
resource "aws_route_table_association" "demorouteassociate-2" {
  route_table_id = aws_route_table.demoroute.id
  subnet_id      = aws_subnet.demosubnet-2.id
}

resource "aws_route_table_association" "demorouteassoicate-3" {
  route_table_id = aws_route_table.demoroute.id
  subnet_id      = aws_subnet.demosubnet-3.id
}