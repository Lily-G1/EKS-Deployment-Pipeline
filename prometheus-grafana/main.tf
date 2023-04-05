# provisioning script to eks-cluster
data "aws_eks_cluster" "cluster_id" {
  name = "eks-cluster-demo"
}

resource "null_resource" "eks_cluster_monitoring" {
    provisioner "local-exec" {
        command = "sh eks_monitoring_provision.sh ${data.aws_eks_cluster.cluster_id.id}"
    }
}
