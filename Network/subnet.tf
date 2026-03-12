resource "aws_subnet" "Demomodulepublicsubnet" {
    count=length(var.public_subnet_cidr)
    vpc_id = aws_vpc.Demomodulevpc.id
    cidr_block = element(var.public_subnet_cidr,count.index)
    availability_zone = element(var.availability_zone,count.index)
    tags = {
        "name"="${var.vpc_name}-public-subnet-${count.index + 1 }"
    }

    }

resource "aws_subnet" "Demomoduleprivatesubnet" {
    count= var.env=="Dev"?0:length(var.private_subnet_cidr)
    vpc_id = aws_vpc.Demomodulevpc.id
    cidr_block = element(var.private_subnet_cidr,count.index)
    availability_zone = element(var.availability_zone,count.index)
    tags = {
        "name"="${var.vpc_name}-private-subnet-${count.index + 1 }"
    }

    }
