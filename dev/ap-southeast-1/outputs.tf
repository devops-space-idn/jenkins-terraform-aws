output "jenkins_host_public_ip" {
  description = "Public IP address of jenkins EC2 instance"
  value       = aws_instance.belajar_jenkins.public_ip
}

output "jenkins_web_url" {
  description = "URL of Jenkins web application"
  value       = "http://${aws_instance.belajar_jenkins.public_ip}:8080/"
}
