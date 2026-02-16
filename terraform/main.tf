module "ec2" {
  source = "./modules/ec2"

  image_tag       = var.image_tag
  docker_username = "YOUR_DOCKER_USERNAME"
  key_name        = "YOUR_KEYPAIR_NAME"
}
