module "gamma_users" {
  source = "../scenario2/modules/iam"

  users = {
    terry = { name = "Terry", role = "Developer", products = ["Gamma"], group = "gamma" },
  }

  groups = {
    gamma = { name = "GammaGroup" },
  }
}
