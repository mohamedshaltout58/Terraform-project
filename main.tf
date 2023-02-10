module "s3-bucket" {
  source = "./s3"
  bucket-name = "terraform-bucket-for-state"
  status-bucket = "Enabled"
}

module "vpc" {
  source   = "./vpc"
  vpc-name = "lab3-vpc"
  vpc-cidr-block = "10.0.0.0/16"
  subnet-cidr = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  availability-zone = ["us-east-1a","us-east-1a","us-east-1b","us-east-1b"]
  subnet-name = ["public-subnet-1","private-subnet-1","public-subnet-2","private-subnet-2"]
}

module "igw" {
  source = "./igw"
  vpc-id = module.vpc.vpc-id
  table-name = "Terraform-lab3-table"
  internet = "0.0.0.0/0"
  subnet-pub = [module.vpc.subnet-1,module.vpc.subnet-3]
}

module "priv-nw" {
  source = "./priv-nw"
  eip-name = ["eip1","eip2"]
  private-subnets = [module.vpc.subnet-2,module.vpc.subnet-4]
  vpc-id = module.vpc.vpc-id
}

module "security-group" {
  source = "./security-group"
  vpc-id = module.vpc.vpc-id
}

module "load-balancer" {
  source = "./load-balancer"
  pub-lb-sg-id = module.security-group.pub-lb-sg-id
  pub-subnets-id = [module.vpc.subnet-1,module.vpc.subnet-3]
  vpc-id = module.vpc.vpc-id
  priv-lb-sg-id = module.security-group.priv-lb-sg-id
  priv-subnets-id = [module.vpc.subnet-2,module.vpc.subnet-4]

}

module "ec2" {
  source = "./ec2"
  public-subnets-id = [module.vpc.subnet-1,module.vpc.subnet-3]
  ami-id = data.aws_ami.ami.id
  pub-ec2-sg-id = module.security-group.pub-ec2s-sg-id
  key-name = aws_key_pair.my-key.key_name
  pub-ec2-name = ["public-ec2-1","public-ec2-2"]
  public-lb-tg-arn = module.load-balancer.pub-lb-tg-arn
  priv-subnets-id = [module.vpc.subnet-2,module.vpc.subnet-4]
  priv-ec2-sg-id = module.security-group.priv-ec2s-sg-id
  priv-ec2-name = ["private-ec2-1","private-ec2-2"]
  private-lb-tg-arn = module.load-balancer.priv-lb-tg-arn
  private-lb-dns = module.load-balancer.priv-lb-dns
}