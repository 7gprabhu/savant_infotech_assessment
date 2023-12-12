module "alpha_users" {
  source = "../modules/iam"

  users = {
    alice = { name = "Alice", role = "Developer", products = ["Alpha", "Gamma"], group = "alpha" },
    john  = { name = "John", role = "QA", products = ["Alpha"], group = "alpha" },
  }

  groups = {
    alpha = { name = "AlphaGroup" },
  }
}
