terraform-aws-vpc
=================

Terraform module to create VPC. It creates VPC with 3 public and 3 private subnets.


Usage
-----

```hcl
module "network" {
  source           = "Smartbrood/vpc/aws"
  region           = "${var.region}"
  vpc_cidr         = "10.0.0.0/16"
  public_subnet_a  = "10.0.0.0/24"
  public_subnet_b  = "10.0.1.0/24"
  public_subnet_c  = "10.0.2.0/24"
  private_subnet_a = "10.0.3.0/24"
  private_subnet_b = "10.0.4.0/24"
  private_subnet_c = "10.0.5.0/24"
  tags = {
    Name        = "My_project_name"
    Terraform   = "true"
  }
}


output "network_values" {
  value       = "${module.network.values}"
}
```


Authors
-------

Module managed by [Smartbrood LLC](https://github.com/Smartbrood).


License
-------

Apache 2 Licensed. See LICENSE for full details.
