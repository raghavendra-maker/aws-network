output "vpc_id" {
    value="aws_vpc.Demomodulevpc.id"
  
}

output "vpc_name" {
    value = "var.vpc_name"
  
}

output "env" {
    value = "env"
  
}

output "publicsubnets" {
    value ="aws_subnet.Demomodulepublicsubnet.*.id"
  
}

output "publicsubnets_1" {
    value ="aws_subnet.Demomodulepublicsubnet.0.id"
  
}

output "privatesubnets" {
    value = "aws_subnet.Demomoduleprivatesubnet.*.id"
  
}

output "route_table" {
    value = "aws_route.module_private_route"
  
}