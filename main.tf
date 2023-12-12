provider "aws" {
  region = "us-east-1"
}

module "alpha" {
  source = "./environments/alpha"
}

module "beta" {
  source = "./environments/beta"
}

module "iam" {
  source = "./modules/iam"
}
