module "network" {
  source              = "../Modules/Network"
  vpc_cidr            = "172.16.0.0/16"
  vpc_name            = "CloudGroup"
  env                 = "Dev"
  public_subnet_cidr  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
  private_subnet_cidr = null
  availability_zone   = ["us-east-2a", "us-east-2b", "us-east-2c"]
NGW=null
}