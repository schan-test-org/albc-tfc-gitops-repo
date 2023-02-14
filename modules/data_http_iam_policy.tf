data "http" "iam_policy" {
  url = format(local.IAM_POLICY_URL, var.helm_app_version)
  request_headers = {
    Accept = "text/plain"
  }
}