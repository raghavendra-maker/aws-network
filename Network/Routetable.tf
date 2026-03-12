resource "aws_route_table" "Demomoduleroutetablepublic" {
    vpc_id = aws_vpc.Demomodulevpc.id
    tags={
        "name"="$(var.vpc_name)-Public_table"
    }
    route {
        gateway_id = aws_internet_gateway.Demomoduleigw.id
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "publicroutetableassociate" {
    count = length(var.public_subnet_cidr)
    route_table_id = aws_route_table.Demomoduleroutetablepublic.id
    subnet_id = element(aws_subnet.Demomodulepublicsubnet.*.id,count.index)

  
}

resource "aws_route_table" "Demomoduleroutetableprivate" {
    vpc_id = aws_vpc.Demomodulevpc.id
    tags={
        "name"="$(var.vpc_name)-Private_table"
    }
}


resource "aws_route" "module_private_route" {
  count                  = var.env == "Prod" ? 1 : 0
  route_table_id         = aws_route_table.Demomoduleroutetableprivate.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.NGW
}




resource "aws_route_table_association" "privateroutetableassociate" {
    count = var.env =="Dev"? 0 : length(var.private_subnet_cidr)
    route_table_id = aws_route_table.Demomoduleroutetableprivate.id
    subnet_id = element(aws_subnet.Demomoduleprivatesubnet.*.id,count.index)
    
  
}