provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source              = "./modules/vpc"
  cidr_block          = "10.0.0.0/16"
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones  = ["us-west-2a", "us-west-2b"]
}

resource "aws_security_group" "ec2" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-0c55b159cbfafe1f0"
  instance_type     = "t2.micro"
  subnet_id         = element(module.vpc.private_subnets, 0)
  security_group_ids = [aws_security_group.ec2.id]
  key_name          = "my-key-pair"
  tags              = {
    Name = "MyEC2Instance"
  }
}

module "rds" {
  source                = "./modules/rds"
  allocated_storage     = 20
  engine                = "mysql"
  instance_class        = "db.t2.micro"
  name                  = "mydatabase"
  username              = "admin"
  password              = "password"
  db_subnet_group_name  = "my-subnet-group"
  subnet_ids            = module.vpc.private_subnets
  vpc_security_group_ids = [aws_security_group.rds.id]
  tags                  = {
    Name = "MyRDSInstance"
  }
}
