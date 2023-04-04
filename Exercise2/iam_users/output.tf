output "iam_user_names" {
  value = values(aws_iam_user.iam_users)[*].name
}
