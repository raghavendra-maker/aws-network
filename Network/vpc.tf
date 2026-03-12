resource "aws_vpc" "Demomodulevpc" {
    cidr_block = var.vpc_cidr
    tags={
        "name"="var.vpc_name"
        "env"="var.env"
    }
  
}

resource "aws_internet_gateway" "Demomoduleigw" {
    vpc_id = aws_vpc.Demomodulevpc.id
    tags = {
      "name"="${var.vpc_name}-igw"
    }
  }