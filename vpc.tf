// CREATE VPC 

resource "aws_vpc" "server-vpc" {
  cidr_block       = var.cidr_blocks
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "server-vpc"
  }
}


// DEFINE SUBNETS 

resource "aws_subnet" "server-subnets1" {
  vpc_id               = aws_vpc.server-vpc.id
  cidr_block           = "10.0.1.0/24"
  availability_zone_id = "use2-az1"
}

resource "aws_subnet" "server-subnets2" {
  vpc_id               = aws_vpc.server-vpc.id
  cidr_block           = "10.0.2.0/24"
  availability_zone_id = "use2-az2"
}

resource "aws_subnet" "server-subnets3" {
  vpc_id               = aws_vpc.server-vpc.id
  cidr_block           = "10.0.3.0/24"
  availability_zone_id = "use2-az3"
}


// CREATE INTERNET GATEWAY 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.server-vpc.id

  tags = {
    Name = "server-gw"
  }
}



// CREATE INTERNET GATEWAY
 
resource "aws_route_table" "server-rt" {
  vpc_id = aws_vpc.server-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "server-rt"
  }
}

//  ROUTE TABLE ASSOCIATIONS

resource "aws_route_table_association" "subnet1_rt" {
  subnet_id = aws_subnet.server-subnets1.id
  route_table_id = aws_route_table.server-rt.id
}

resource "aws_route_table_association" "subnet2_rt" {
  subnet_id = aws_subnet.server-subnets2.id
  route_table_id = aws_route_table.server-rt.id
}
resource "aws_route_table_association" "subnet3_rt" {
  subnet_id = aws_subnet.server-subnets3.id
  route_table_id = aws_route_table.server-rt.id
}
