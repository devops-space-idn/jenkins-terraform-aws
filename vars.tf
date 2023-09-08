variable "PATH_TO_PUBLIC_KEY" {
  default = "belajar.pub"
}

variable "ssh_cidr_whitelist" {
  description = "Allow SSH from CIDRs listed"
  type        = list(string)
  default     = ["36.69.0.0/16", "114.125.0.0/16"]
}

variable "jenkins_cidr_whitelist" {
  description = "Allow SSH from CIDRs listed"
  type        = list(string)
  default     = ["36.69.0.0/16", "114.125.0.0/16"]
}