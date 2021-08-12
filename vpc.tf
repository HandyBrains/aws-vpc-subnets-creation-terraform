#create VPC
resource "aws_vpc" "customVPC" {
  cidr_block       = var.VPC-CIDR
  instance_tenancy = "default"

  tags = {
    Name = "PRD-VPC"
  }
}

resource "aws_subnet" "PRD-VPC-DMZ-AZ1-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-DMZ-AZ1-SUBNET
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PRD-VPC-DMZ-AZ1-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-DMZ-AZ2-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-DMZ-AZ2-SUBNET
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-DMZ-AZ2-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-DMZ-AZ3-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-DMZ-AZ3-SUBNET
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-DMZ-AZ3-SUBNET"
  }
}


resource "aws_subnet" "PRD-VPC-WEB-AZ1-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-WEB-AZ1-SUBNET
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-WEB-AZ1-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-WEB-AZ2-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-WEB-AZ2-SUBNET
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-WEB-AZ2-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-WEB-AZ3-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-WEB-AZ3-SUBNET
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-WEB-AZ3-SUBNET"
  }
}


resource "aws_subnet" "PRD-VPC-APP-AZ1-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-APP-AZ1-SUBNET
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-APP-AZ1-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-APP-AZ2-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-APP-AZ2-SUBNET
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-APP-AZ2-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-APP-AZ3-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-APP-AZ3-SUBNET
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-APP-AZ3-SUBNET"
  }
}


resource "aws_subnet" "PRD-VPC-DB-AZ1-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-DB-AZ1-SUBNET
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-DB-AZ1-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-DB-AZ2-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-DB-AZ2-SUBNET
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-DB-AZ2-SUBNET"
  }
}

resource "aws_subnet" "PRD-VPC-DB-AZ3-SUBNET" {
  vpc_id                  = aws_vpc.customVPC.id
  cidr_block              = var.PRD-VPC-DB-AZ3-SUBNET
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "PRD-VPC-DB-AZ3-SUBNET"
  }
}
#create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.customVPC.id

  tags = {
    Name = "PROD-IGW"
  }
}

resource "aws_route_table" "PRD-VPC-DMZ-RT" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = {
    Name = "PRD-VPC-DMZ-RT"
  } 
}
resource "aws_route_table" "PRD-VPC-WEB-RT" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = {
    Name = "PRD-VPC-WEB-RT"
  } 
}
resource "aws_route_table" "PRD-VPC-APP-RT" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "PRD-VPC-APP-RT"
  }
}
resource "aws_route_table" "PRD-VPC-DB-RT" {
  vpc_id = aws_vpc.customVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "PRD-VPC-DB-RT"
  }
}

#Associate route table to public subnet
resource "aws_route_table_association" "DMZ-AZ1_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-DMZ-AZ1-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-DMZ-RT.id
}

resource "aws_route_table_association" "DMZ-AZ2_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-DMZ-AZ2-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-DMZ-RT.id
}

resource "aws_route_table_association" "DMZ-AZ3_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-DMZ-AZ3-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-DMZ-RT.id
}

resource "aws_route_table_association" "WEB-AZ1_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-WEB-AZ1-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-WEB-RT.id
}

resource "aws_route_table_association" "WEB-AZ2_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-WEB-AZ2-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-WEB-RT.id
}

resource "aws_route_table_association" "WEB-AZ3_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-WEB-AZ3-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-WEB-RT.id
}
resource "aws_route_table_association" "APP-AZ1_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-APP-AZ1-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-APP-RT.id
}

resource "aws_route_table_association" "APP-AZ2_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-APP-AZ2-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-APP-RT.id
}

resource "aws_route_table_association" "APP-AZ3_rt_association" {
  subnet_id      = aws_subnet.PRD-VPC-APP-AZ3-SUBNET.id
  route_table_id = aws_route_table.PRD-VPC-APP-RT.id
}
# we are adding the DB layer (DB subnets to nat gateway)
#resource "aws_route_table_association" "DB-AZ1_rt_association" {
 # subnet_id      = aws_subnet.PRD-VPC-DB-AZ1-SUBNET.id
  #route_table_id = aws_route_table.PRD-VPC-DB-RT.id
#}

#resource "aws_route_table_association" "DB-AZ2_rt_association" {
 # subnet_id      = aws_subnet.PRD-VPC-DB-AZ2-SUBNET.id
  #route_table_id = aws_route_table.PRD-VPC-DB-RT.id
#}

#resource "aws_route_table_association" "DB-AZ3_rt_association" {
 # subnet_id      = aws_subnet.PRD-VPC-DB-AZ3-SUBNET.id
  #route_table_id = aws_route_table.PRD-VPC-DB-RT.id
#}