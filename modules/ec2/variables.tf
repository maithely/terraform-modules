variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}

variable "subnet_id" {
  description = "The VPC subnet ID to launch in"
  type        = string
}

variable "security_group_ids" {
  description = "The security groups to associate with the instance"
  type        = list(string)
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
