# Terraform AWS Project

## Overview

This project sets up a basic AWS infrastructure using Terraform. It creates:
- A VPC with two public and two private subnets across two availability zones.
- A NAT Gateway for internet access from private subnets.
- An EC2 instance in one private subnet.
- An RDS instance in another private subnet.

## Directory Structure

```sh
terraform-aws-project/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md

