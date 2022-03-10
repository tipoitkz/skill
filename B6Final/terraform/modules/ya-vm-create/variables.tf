variable "vpc_subnet_id" {
  description = "VPC subnet network id"
  type        = string
}

variable "cc_image" {
  description = "Image for compute cloud VM"
  type        = string
}

variable "cc_name" {
  description = "Name for cloud VM"
  type        = string
}

variable "cc_nat" {
  description = "Use nat"
  type        = bool
}