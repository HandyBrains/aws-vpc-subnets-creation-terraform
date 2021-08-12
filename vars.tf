variable "aws_region" {
  default = "eu-west-1"
}

variable "amis" {
  type = map(string)
  default = {
    eu-west-1 = "ami-02b4e72b17337d6c1"
    eu-west-2 = "ami-0d26eb3972b7f8c96"
    eu-west-3 = "ami-0d49cec198762b78"
    eu-central-1 = "ami-0453cb7b5f2b7fca2"
    eu-norht-1 = "ami-0d441f5643da997cb"
  }
}

variable "appserver-instance_type" {
  default = "t3.micro"
}

variable "dbserver-instance_type" {
  default = "t2.micro"
}
variable "appserver-key_name" {
  default = "bs-amazon-linux"
}

variable "dbserver-key_name" {
  default = "bs-amazon-linux"
}

variable "VPC-CIDR" {
  type    = string
  default = "10.204.0.0/20"
}

variable "PRD-VPC-DMZ-AZ1-SUBNET" {
  type    = string
  default = "10.204.0.0/24"
}

variable "PRD-VPC-DMZ-AZ2-SUBNET" {
  type    = string
  default = "10.204.1.0/24"
}

variable "PRD-VPC-DMZ-AZ3-SUBNET" {
  type    = string
  default = "10.204.2.0/24"
}

variable "PRD-VPC-WEB-AZ1-SUBNET" {
  type    = string
  default = "10.204.3.0/24"
}

variable "PRD-VPC-WEB-AZ2-SUBNET" {
  type    = string
  default = "10.204.4.0/24"
}

variable "PRD-VPC-WEB-AZ3-SUBNET" {
  type    = string
  default = "10.204.5.0/24"
}

variable "PRD-VPC-APP-AZ1-SUBNET" {
    type = string
    default = "10.204.6.0/24"
}

variable "PRD-VPC-APP-AZ2-SUBNET" {
    type = string
    default = "10.204.7.0/24"
}

variable "PRD-VPC-APP-AZ3-SUBNET" {
    type = string
    default = "10.204.8.0/24"
}

variable "PRD-VPC-DB-AZ1-SUBNET" {
    type =  string
    default = "10.204.9.0/24"
}

variable "PRD-VPC-DB-AZ2-SUBNET" {
    type =  string
    default = "10.204.10.0/24"
}

variable "PRD-VPC-DB-AZ3-SUBNET" {
    type =  string
    default = "10.204.11.0/24"
}