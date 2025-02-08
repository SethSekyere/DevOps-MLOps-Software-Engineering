variable "region_name" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-04681163a08179f28"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "key_name" {
  type    = string
  default = "afcon2024-key"

}

variable "subnet_id" {
  type    = string
  default = "subnet-0e8e327428e94b04d"

}

variable "vpc_security_group_ids" {
  type    = list(any)
  default = ["sg-075b1384f02092a1f"]

}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"

}