#PRD-VPC-DMZ-NACL
#PRD-VPC-WEB-NACL
#PRD-VPC-APP-NACL
#PRD-VPC-DB-NACL

resource "aws_network_acl" "PRD-VPC-DMZ-NACL" {
  vpc_id = aws_vpc.customVPC.id
  subnet_ids = [ aws_subnet.PRD-VPC-DMZ-AZ1-SUBNET.id,aws_subnet.PRD-VPC-DMZ-AZ2-SUBNET.id,aws_subnet.PRD-VPC-DMZ-AZ3-SUBNET.id ]
  
  tags = {
    Name = "PRD-VPC-DMZ-NACL"
  }
}

resource "aws_network_acl" "PRD-VPC-WEB-NACL" {
  vpc_id = aws_vpc.customVPC.id
  subnet_ids = [ aws_subnet.PRD-VPC-WEB-AZ1-SUBNET.id,aws_subnet.PRD-VPC-WEB-AZ2-SUBNET.id,aws_subnet.PRD-VPC-WEB-AZ3-SUBNET.id ]
  
  tags = {
    Name = "PRD-VPC-WEB-NACL"
  }
}

resource "aws_network_acl" "PRD-VPC-APP-NACL" {
  vpc_id = aws_vpc.customVPC.id
  subnet_ids = [ aws_subnet.PRD-VPC-APP-AZ1-SUBNET.id,aws_subnet.PRD-VPC-APP-AZ2-SUBNET.id,aws_subnet.PRD-VPC-APP-AZ3-SUBNET.id ]
 
  tags = {
    Name = "PRD-VPC-APP-NACL"
  }
}

resource "aws_network_acl" "PRD-VPC-DB-NACL" {
  vpc_id = aws_vpc.customVPC.id
  subnet_ids = [ aws_subnet.PRD-VPC-DB-AZ1-SUBNET.id,aws_subnet.PRD-VPC-DB-AZ2-SUBNET.id,aws_subnet.PRD-VPC-DB-AZ3-SUBNET.id ]
  
  tags = {
    Name = "PRD-VPC-DB-NACL"
  }
}