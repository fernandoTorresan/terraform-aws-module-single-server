# ----------------------------------------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------------------------------------

variable "ami" {
  description = "The AMI to use for the instance."
  default     = ""
}

locals {
  ami = "${var.ami != "" ? var.ami : data.aws_ami.default.image_id}"
}

data "aws_ami" "default" {
  most_recent = "true"

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "main" {
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_pair_name}"
  ami             = "${data.aws_ami.default.image_id}"
  security_groups = "${var.security_groups}"

  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  subnet_id              = "${var.subnet_id}"

  root_block_device {
    volume_type           = "${var.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }

  tags {
    Name = "${var.instance_name}"
  }
}
