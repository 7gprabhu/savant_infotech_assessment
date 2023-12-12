variable "users" {
  type = map(any)
}

variable "groups" {
  type = map(any)
}

resource "aws_iam_user" "iam_users" {
  for_each = var.users

  name = each.value.name

  tags = {
    Role     = each.value.role
    Products = join(",", each.value.products)
  }
}

resource "aws_iam_group" "iam_groups" {
  for_each = var.groups

  name = each.value.name
}

resource "aws_iam_group_membership" "group_membership" {
  for_each = var.users

  name = each.value.name
  users = [aws_iam_user.iam_users[each.value.name].name]
  group = aws_iam_group.iam_groups[each.value.group].name
}
