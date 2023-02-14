locals {
  IAM_POLICY_URL = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/%s/docs/install/iam_policy.json"
  CRDS_URL       = "https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml"

  policy_name          = format("%s-alb-controller-%s", var.eks_cluster_name, random_string.random.result)
  role_name            = format("%s-alb-controller-%s", var.eks_cluster_name, random_string.random.result)
  service_account_name = format("%s-alb-controller-%s", replace(var.eks_cluster_name, "_", "-"), random_string.random.result)

  values = templatefile("${path.module}/template/alb_values.tpl", {
    replicaCount = var.replica_count
    clusterName  = var.eks_cluster_name
    region       = var.region
    vpcId        = var.vpc_id

    role_arn             = aws_iam_role.alb.arn
    service_account_name = local.service_account_name

    resources                   = var.resources
    affinity                    = var.affinity
    node_selector               = var.node_selector
    tolerations                 = var.tolerations
    topology_spread_constraints = var.topology_spread_constraints
    service_monitor_enabled     = var.service_monitor_enabled
  })
}

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}
