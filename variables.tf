variable "region" { 

}

variable "vpc_cidr" { 
  default = "10.0.0.0/16" 
  description = "CIDR ip addresses block for VPC"
}

variable "public_subnet_a" { 
  default = "10.0.1.0/24"
}

variable "public_subnet_b" { 
  default = "10.0.2.0/24"
}

variable "public_subnet_c" { 
  default = "10.0.3.0/24"
}

variable "private_subnet_a" { 
  default = "10.0.11.0/24"
}

variable "public_subnet_b" { 
  default = "10.0.12.0/24"
}

variable "public_subnet_c" { 
  default = "10.0.13.0/24"
}

variable "tags" {
  type = "map"
  default = {
    Name = "Stage"
    Terraform   = "true"
  }
}






