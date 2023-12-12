module "beta_resources" {
  source           = "../scenario1/modules"
  bucket_name      = "s3_proj_beta"
  instance_name    = "db_proj_beta"
}
