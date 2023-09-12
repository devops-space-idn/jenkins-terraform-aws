data "aws_route53_zone" "devops-space" {
  name = "devops-space.my.id"
}

resource "aws_route53_record" "jenkins_record" {
  zone_id = data.aws_route53_zone.devops-space.zone_id
  name    = "jenkins.${data.aws_route53_zone.devops-space.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.belajar_jenkins.public_ip]
}