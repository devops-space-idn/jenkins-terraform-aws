variable "PATH_TO_PUBLIC_KEY" {
  default = "belajar.pub"
}

variable "ssh_cidr_whitelist" {
  description = "Allow SSH from CIDRs listed"
  type        = list(string)
  default     = ["52.220.17.199/32"]
}

variable "jenkins_cidr_whitelist" {
  description = "Allow SSH from CIDRs listed"
  type        = list(string)
  default     = ["52.220.17.199/32"]
}
