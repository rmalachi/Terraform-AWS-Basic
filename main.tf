# Create a VPC
resource "aws_vpc" "wdgtl-vpc" {
  cidr_block           = "20.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC-20.0.0.0"
  }
}

resource "aws_subnet" "wdgtl-public-subnet" {
  vpc_id                  = aws_vpc.wdgtl-vpc.id
  cidr_block              = "20.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-subnet-us-east-1a-20.0.1.0"
  }
}

resource "aws_subnet" "wdgtl-private-subnet" {
  vpc_id                  = aws_vpc.wdgtl-vpc.id
  cidr_block              = "20.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "private-subnet-us-east-1a-20.0.2.0"
  }
}
