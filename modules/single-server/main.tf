# ----------------------------------------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "" {
  ami           = ""
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"

  block_device {}

  ebs_block_device {
    device_name = ""
    volume_type = ""
    volume_size = ""

    delete_on_termination = true
  }

  connection {}

  tags {
    Name = "${var.instance_name}"
  }
}

resource "aws_security_group" {
  ingress {
    from_port = 0
    protocol  = ""
    to_port   = 0
  }

  egress {
    from_port = 0
    protocol  = ""
    to_port   = 0
  }
}

resource "aws_security_group_rule" "" {
  from_port         = 0
  protocol          = ""
  security_group_id = ""
  to_port           = 0
  type              = "egress"
}
