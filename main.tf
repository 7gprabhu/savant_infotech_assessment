provider "aws" {
  region = "us-east-1"  # replace with your desired region
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
