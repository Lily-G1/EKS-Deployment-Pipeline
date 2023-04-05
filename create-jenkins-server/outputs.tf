# output "ec2_public_ip" {
#   value = aws_instance.myapp-server.public_ip
# }

output "ec2_instance_public_ip" {
  value = aws_instance.jenkins-server.public_ip
}