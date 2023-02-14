############################# main : var #######################################

variable "env" { type = string }
# variable "eks_tfstat_path" { type = string }
# variable "aws_profile" { type = string }
variable "aws_region" { type = string }
variable "project" { type = string }
variable "default_tags" { type = map(string) }

############################# bknd & vpc & network about : var #######################################

# variable "backend_s3_bucket_name" { default = "" }
# variable "infra_network_s3_key" { default = "" }
# variable "eks_s3_key" { default = "" }
variable "tfc_org" { default = "" }
variable "tfc_wk" { default = "" }
############################# eks-cluster : var #######################################
variable "eks_cluster_name" {}
variable "eks_endpoint_url" { default = "" }
variable "eks_auth_token" { default = "" }
variable "eks_cluster_certificate_authority_data" { default = "" }
variable "eks_oidc_provider_arn" { default = "" }
variable "eks_oidc_provider_url" { default = "" }

############################# helm : var #######################################
variable "helm_release_name" { default = "" }
variable "helm_chart_name" { default = "" }
variable "helm_chart_version" { default = "" }
variable "helm_app_version" { default = "" }
variable "helm_repository_url" { default = "" }
variable "create_namespace" { default = false }
variable "namespace" { default = "kube-system" }
variable "vpc_id" { default = "" }
variable "replica_count" { default = 1 }
variable "resources" { default = "" }
variable "affinity" { default = "" }
variable "tolerations" { default = "" }
variable "node_selector" { default = "" }
variable "topology_spread_constraints" { default = "" }
variable "service_monitor_enabled" { default = false }




