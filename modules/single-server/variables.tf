variable "instance_name" {
  description = "Name of the server"
}

variable "root_volume_type" {
  description = "The type of volume. Can be 'standard', 'gp2', 'io1', 'sc1' ou 'st1'. "
  default     = "standard"
}

variable "root_volume_size" {
  description = "The size of the volume in gibibytes."
  default     = 8
}

variable "delete_on_termination" {
  description = "If the volume should be destroyed on instance termination."
  default     = true
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in."
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with."
  type        = "list"
  default     = []
}

variable "security_groups" {
  description = "A list of security group names or IDs to associate with."
  type        = "list"
  default     = []
}

variable "key_pair_name" {
  description = "Name of key pair to access via SSH"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Type of instance to be created"
}
