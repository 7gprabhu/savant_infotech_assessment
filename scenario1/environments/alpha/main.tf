module "alpha_resources" {
  source           = "../scenario1/modules"
  bucket_name      = "s3_proj_alpha"
  instance_name    = "db_proj_alpha"
}
