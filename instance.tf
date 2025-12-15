resource "aws_instance" "demo_instance" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key
  subnet_id                   = aws_subnet.demosubnet-1.id
  security_groups             = [aws_security_group.demosg.id]
  associate_public_ip_address = true
  tags = {
    "Name" = "Dev-Web-Server"
  }
  private_ip = "10.50.1.100"
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }
}