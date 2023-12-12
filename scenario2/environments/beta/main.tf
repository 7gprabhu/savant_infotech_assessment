module "beta_users" {
  source = "../scenario2/modules/iam"

  users = {
    bob     = { name = "Bob", role = "QA", products = ["Beta"], group = "beta" },
    michael = { name = "Michael", role = "Developer", products = ["Beta", "Gamma"], group = "beta" },
    mike    = { name = "Mike", role = "QA", products = ["Beta", "Gamma"], group = "beta" },
  }

  groups = {
    beta = { name = "BetaGroup" },
  }
}
