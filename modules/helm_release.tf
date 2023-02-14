resource "helm_release" "aws-load-balancer-controller" {
  name       = var.helm_release_name
  chart      = var.helm_chart_name
  version    = var.helm_chart_version == "" ? null : var.helm_chart_version
  repository = var.helm_repository_url

  create_namespace = var.create_namespace
  namespace        = var.namespace

  values = [
    local.values
  ]

  depends_on = [
    kubernetes_manifest.apply-crds
  ]
}
