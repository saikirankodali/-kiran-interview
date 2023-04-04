# main.tf
locals {
  users = {
    "user1" = {
      username = "jerome"
      groups   = ["group1", "group2"]
    },
    "user2" = {
      username = "marc"
      groups   = ["group2", "group3"]
    }
  }
}


# Define the AWS provider
provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

resource "aws_iam_user" "iam_users" {
  for_each = local.users

  name = each.value.username
}

resource "aws_iam_user_group_membership" "iam_user_groups" {
  for_each = local.users

  user = aws_iam_user.iam_users[each.key].name
  groups = each.value.groups
}
