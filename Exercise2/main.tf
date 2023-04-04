# main.tf


module "iam-users" {
  source = "./iam_users"

  # Optional: Override the 'users' local variable
  # locals = {
  #   users = {
  #     "user1" = {
  #       username = "alice"
  #       groups   = ["group1", "group2", "group3"]
  #     },
  #     "user2" = {
  #       username = "bob"
  #       groups   = ["group1", "group3"]
  #     }
  #   }
  # }
}

output "iam_user_names" {
  value = module.iam-users.iam_user_names
}
