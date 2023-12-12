variable "users" {
  default = {
    "Alice"  = { role = "Developer", products = ["Alpha", "Gamma"] }
    "Bob"    = { role = "QA", products = ["Beta"] }
    "Michael"= { role = "Developer", products = ["Beta"] }
    "Mike"   = { role = "QA", products = ["Beta", "Gamma"] }
    "Terry"  = { role = "Developer", products = ["Gamma"] }
    "John"   = { role = "QA", products = ["Alpha"] }
  }
}

resource "aws_iam_user" "users" {
  for_each = var.users

  name = each.key
  tags = {
    Role    = each.value.role
    Products = join(",", each.value.products)
  }
}

resource "aws_iam_group" "groups" {
  for_each = distinct(values(var.users[*].role))

  name = each.key
}

resource "aws_iam_group_membership" "user_memberships" {
  for_each = var.users

  name = aws_iam_group.groups[each.value.role].name
  users = [aws_iam_user.users[each.key].name]
}

