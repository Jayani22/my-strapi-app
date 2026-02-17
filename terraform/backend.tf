terraform {
  backend "s3" {
    bucket  = "jayani-strapi-terraform-state"
    key     = "strapi/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
