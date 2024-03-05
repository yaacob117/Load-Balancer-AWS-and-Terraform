# // VPC variables  

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "cidr_blocks" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc CIDR blocks"
}
variable "subnets" {
  type = map(any)
  default = {
    subnet-a = {
      az   = "use1-az1"
      cidr = "10.0.1.0/24"
    }
    subnet-b = {
      az   = "use1-az2"
      cidr = "10.0.2.0/24"
    }
    subnet-c = {
      az   = "use1-az3"
      cidr = "10.0.3.0/24"
    }
  }

}

# // security group variables 

variable "inbound_ports" {
  type        = list(number)
  default     = [80, 22]
  description = "ports for inbound rules"
}

// EC2 varaibles

variable "ec2_ami" {
  type        = string
  default     = "ami-06d4b7182ac3480fa"
  description = "machine image for instance"
}
variable "key_pem" {
  type        = string
  default     = "2Final-keys-iac"
  description = "SSH Key"
}



// Load balancer Variables 

variable "port" {
  type    = number
  default = 80
}
variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check" {
  type = map(string)
  default = {
    "interval"            = "300"
    "path"                = "/"
    "timeout"             = "60"
    "matcher"             = "200"
    "healthy_threshold"   = "5"
    "unhealthy_threshold" = "5"
  }
}
variable "listener_port" {
  type    = number
  default = 80
}
  
variable "listener_protocol" {
  type    = string
  default = "HTTP"
 
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-06a0baab588c455db" 
}



// ROUTE53 variables 

variable "domain_name" {
  type    = string
  default = "<YOUR DNS>"
}
variable "sub_domain_name" {
  type    = string
  default = "terraform-infra"

}
