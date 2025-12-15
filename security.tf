resource "aws_security_group" "demosg" {
  vpc_id      = aws_vpc.demovpc-1.id
  name        = "websecurity"
  description = "Secure all the web app ports"
  tags = {
    "Name" = "Dev-SG"
  }
  lifecycle {
    ignore_changes = [
      ingress,
      egress,
    ]
  }
  depends_on = [aws_route_table_association.demorouteassoicate-3]
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.demosg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.demosg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}