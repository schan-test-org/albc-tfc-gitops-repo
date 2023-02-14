module "aws-load-balancer-controller" {
  source = "./modules"

  # project = var.project
  # env     = var.env
  region = local.region

  eks_cluster_name = local.eks_cluster_name
  eks_endpoint_url = local.eks_endpoint_url

  eks_oidc_provider_arn = local.eks_oidc_provider_arn
  eks_oidc_provider_url = local.eks_oidc_provider_url

  # eks_cluster_certificate_authority_data = local.eks_cluster_certificate_authority_data
  # eks_auth_token                         = local.eks_auth_token

  helm_release_name   = var.helm_release_name
  helm_chart_name     = var.helm_chart_name
  helm_chart_version  = var.helm_chart_version
  helm_repository_url = var.helm_repository_url
  helm_app_version    = var.helm_app_version

  create_namespace        = var.create_namespace
  namespace               = var.namespace
  vpc_id                  = local.vpc_id
  replica_count           = var.replica_count
  service_monitor_enabled = var.service_monitor_enabled

  resources                   = var.resources
  affinity                    = var.affinity
  node_selector               = var.node_selector
  tolerations                 = var.tolerations
  topology_spread_constraints = var.topology_spread_constraints

  common_tags = local.common_tags
}
