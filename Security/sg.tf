resource "aws_security_group" "DemoModuleSecurity" {
  vpc_id = var.vpc_id
  name   = "${var.vpc_name}-websecurity"
  tags = {
    "Name" = "websecurity"
    "Env"  = var.env
  }
  description = "allowing web server ports"
  dynamic "ingress" {
    for_each = local.ingress_rule1
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "ingress" {
    for_each = local.ingress_rule2
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}