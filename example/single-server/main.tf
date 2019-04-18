module "ec2" {
  source = "../../modules/single-server"

  instance_name          = "simple-server"
  key_pair_name          = "fernando-torresan"
  vpc_security_group_ids = ["sg-000fb47d29a4975ff"]
}
