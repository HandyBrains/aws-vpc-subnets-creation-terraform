#ssh key to access public subnet

resource "aws_instance" "webserver" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.appserver-instance_type
  key_name               = var.appserver-key_name
  subnet_id              = aws_subnet.PRD-VPC-DMZ-AZ1-SUBNET.id
  vpc_security_group_ids = [aws_security_group.public-sg.id]
  user_data              = file("userdata.sh")

  tags = {
    Name = "PRD-DMZ-AZ1-Webserver"
  }
}

resource "aws_instance" "dbserver" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.dbserver-instance_type
  key_name               = var.dbserver-key_name
  subnet_id              = aws_subnet.PRD-VPC-DB-AZ1-SUBNET.id
  vpc_security_group_ids = [aws_security_group.private-sg.id]

  tags = {
    Name = "PRD-DB-AZ1-DBserver"
  }
}
