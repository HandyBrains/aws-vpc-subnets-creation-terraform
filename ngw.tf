# nat gw
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.PRD-VPC-DMZ-AZ1-SUBNET.id
  depends_on    = [aws_internet_gateway.igw]
}

# VPC setup for NAT
resource "aws_route_table" "ngw-private-rt" {
  vpc_id = aws_vpc.customVPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "PRD_NGW-PRIVATE-RT"
  }
}

# route associations private
resource "aws_route_table_association" "ngw-AZ1-private-rt" {
  subnet_id      = aws_subnet.PRD-VPC-DB-AZ1-SUBNET.id
  route_table_id = aws_route_table.ngw-private-rt.id
}

resource "aws_route_table_association" "ngw-AZ2-private-rt" {
  subnet_id      = aws_subnet.PRD-VPC-DB-AZ2-SUBNET.id
  route_table_id = aws_route_table.ngw-private-rt.id
}

resource "aws_route_table_association" "ngw-AZ3-private-rt" {
  subnet_id      = aws_subnet.PRD-VPC-DB-AZ3-SUBNET.id
  route_table_id = aws_route_table.ngw-private-rt.id
}
