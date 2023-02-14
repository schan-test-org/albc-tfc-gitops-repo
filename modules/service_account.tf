data "aws_iam_policy_document" "alb" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(var.eks_oidc_provider_url, "https://", "")}:sub"
      values = [
        "system:serviceaccount:${var.namespace}:${local.service_account_name}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.eks_oidc_provider_url, "https://", "")}:aud"
      values = [
        "sts.amazonaws.com"
      ]
    }

    principals {
      identifiers = [var.eks_oidc_provider_arn]
      type        = "Federated"
    }
  }
}

# create an iam policy for aws-load-balancer-controller
resource "aws_iam_policy" "alb" {
  name        = local.policy_name
  description = format("policy document for %s aws load balance controller ", var.eks_cluster_name)

  policy = data.http.iam_policy.response_body

  tags = merge(
    var.common_tags,
    tomap({ "Name" = local.policy_name })
  )
}

# create an iam role for aws-load-balancer-controller
resource "aws_iam_role" "alb" {
  assume_role_policy = data.aws_iam_policy_document.alb.json
  name               = local.role_name
  description        = format("role for %s aws load balance controller", var.eks_cluster_name)

  tags = merge(
    var.common_tags,
    tomap({ "Name" = local.role_name })
  )
}

# attach policy to role
resource "aws_iam_role_policy_attachment" "alb" {
  policy_arn = aws_iam_policy.alb.arn
  role       = aws_iam_role.alb.name
}

output "service_account_name" {
  value = local.service_account_name
}
