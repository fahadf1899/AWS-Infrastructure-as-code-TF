<<<<<<< HEAD
module "cpu_alarm" {
    source = "./modules/cpu_alarm"
    instance_id = var.instance_id
    cpu_threshold = var.cpu_threshold
}
=======
terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

#configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
#VPC for  Esell
resource "aws_vpc" "esell_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "esell-vpc"
  }

}
resource "aws_internet_gateway" "esell_igw" {
  vpc_id = aws_vpc.esell_vpc.id
  
  tags = {
    Name = "esell-igw"
  }
}

resource "aws_route_table" "esell_route_table" {
  vpc_id = aws_vpc.esell_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.esell_igw.id
  }

}

resource "aws_route_table_association" "esell_route_table_assoc" {
  subnet_id      = aws_subnet.esell_subnet.id
  route_table_id = aws_route_table.esell_route_table.id
}

resource "aws_route_table_association" "esell_route_table_assoc2" {
  subnet_id      = aws_subnet.esell_subnet2.id
  route_table_id = aws_route_table.esell_route_table.id
}

resource "aws_subnet" "esell_subnet" {
  vpc_id            = aws_vpc.esell_vpc.id
  cidr_block        = "10.0.1.0/24"
  
  tags = {
    Name = "esell-subnet"
  }
}
resource "aws_subnet" "esell_subnet2" {
  vpc_id            = aws_vpc.esell_vpc.id
  cidr_block        = "10.0.2.0/24"
  
  tags = {
    Name = "esell-subnet2"
  }
}

resource "aws_security_group" "esell_sg" {
  name        = "esell-sg"
  description = "Security group for esell"
  vpc_id      = aws_vpc.esell_vpc.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "esell_instance" {
  ami           = "ami-0f8a61b66d1accaee"  #Linux AMI ID for us-east-1
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.esell_subnet.id
  security_groups = [aws_security_group.esell_sg.name]

  tags = {
    Name = "esell-instance"
  }
}






>>>>>>> b5549b7acb0645284cc980a1a987cdf1ea69bfb2
