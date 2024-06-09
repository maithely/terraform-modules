variable "allocated_storage" {
  description = "The amount of allocated storage"
  type        = number
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
}

variable "name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "password" {
  description = "The password for the database"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets for the DB subnet group"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "The security groups to associate with the RDS instance"
  type        = list(string)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
