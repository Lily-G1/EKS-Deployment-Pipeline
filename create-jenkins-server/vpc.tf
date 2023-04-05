# resource "aws_vpc" "myapp-vpc" {
#   cidr_block = var.vpc_cidr_block
#   tags = {
#     Name = "${var.env_prefix}-vpc"
#   }
# }

# resource "aws_subnet" "myapp-subnet-1" {
#   vpc_id            = aws_vpc.myapp-vpc.id
#   cidr_block        = var.subnet_cidr_block
#   availability_zone = var.avail_zone
#   tags = {
#     Name = "${var.env_prefix}-subnet-1"
#   }
# }

# resource "aws_internet_gateway" "myapp-igw" {
#   vpc_id = aws_vpc.myapp-vpc.id
#   tags = {
#     Name = "${var.env_prefix}-igw"
#   }
# }

# resource "aws_default_route_table" "main-rtb" {
#   default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myapp-igw.id
#   }
#   tags = {
#     Name = "${var.env_prefix}-main-rtb"
#   }
# }

# resource "aws_default_security_group" "default-sg" {
#   vpc_id = aws_vpc.myapp-vpc.id
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "${var.env_prefix}-default-sg"
#   }
# }

#CREATE VPC

resource "aws_vpc" "webapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.instance_tag}-vpc"
  }
}

resource "aws_subnet" "webapp-subnet-1" {
  vpc_id            = aws_vpc.webapp-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name = "${var.instance_tag}-subnet-1"
  }
}

resource "aws_internet_gateway" "webapp-igw" {
  vpc_id = aws_vpc.webapp-vpc.id
  tags = {
    Name = "${var.instance_tag}-igw"
  }
}

resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.webapp-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webapp-igw.id
  }
  tags = {
    Name = "${var.instance_tag}-main-rtb"
  }
}

resource "aws_default_security_group" "default-sg" {
  vpc_id = aws_vpc.webapp-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.instance_tag}-default-sg"
  }
}