variable "vpc_id" {
  type        = string
  description = "VPC ID that is used to deploy the jenkins"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for jenkins instance"
}

# variable "PATH_TO_PUBLIC_KEY" {
#   default = "belajar.pub"
# }

variable "ssh_public_key" {
  description = "Public key used for ec2 instances"
}

variable "ssh_cidr_whitelist" {
  type        = list(string)
  description = "Allow SSH from CIDRs listed"
  default     = ["52.220.17.199/32"]
}

variable "jenkins_cidr_whitelist" {
  type        = list(string)
  description = "Allow SSH from CIDRs listed"
  default     = ["52.220.17.199/32"]
}
