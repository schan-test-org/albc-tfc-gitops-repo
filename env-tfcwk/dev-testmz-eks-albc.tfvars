########################################
# Common
########################################
project     = "dev-eks-prj"
aws_region  = "ap-northeast-2"
env             = "dev"

default_tags = {
  dept  = "DEVOPS/TERRAFORM-CLOUD-GITOPS-TESTING"
}

########################################
# etc setting
########################################
# eks_tfstat_path = "mz-dev-eks"
# eks_s3_key             = "eks.tfstat"
# backend_s3_bucket_name = "mz-terra-tfs-i12i"
tfc_org = "schan-test"
tfc_wk = "dev-eks-tfc"
eks_cluster_name       = "devtest-eks"

# vpc_id        = "vpc-0e8acf616f7d0dd34"
vpc_id        = ""

########################################
# helm setting
########################################

helm_release_name   = "aws-load-balancer-controller"
helm_chart_name     = "aws-load-balancer-controller"
helm_chart_version  = "1.4.0"
helm_repository_url = "https://aws.github.io/eks-charts"
helm_app_version    = "v2.4.1"

create_namespace = false
namespace        = "kube-system"

replica_count = 1
service_monitor_enabled = false
# service_monitor_enabled = true

resources = <<EOF
limits:
  memory: "100Mi"
requests:
  cpu: "100m"
  memory: "100Mi"
EOF

affinity = <<EOF
nodeAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
    - matchExpressions:
      - key: role
        operator: In
        values:
        - ops
EOF

node_selector = ""
# node_selector = <<EOF
# role: ops
# EOF

# tolerations   = ""
tolerations = <<EOF
- key: "role"
  operator: "Equal"
  value: "ops"
  effect: "NoSchedule"
EOF

topology_spread_constraints = ""

