# For our 'primary' region.
provider "aws" {
  region = "us-east-1"
}

## Manage the top level hosted zone in our main env file
# You'll take the NS output of this record and apply it to your 'centralized'...
# AWS account. In this setup, we have 1 aws account per env with an 'ops' account that...
# holds our 'shared' resources (like our DNS configuration). This is the only 'outlier' step.
resource "aws_route53_zone" "primary" {
  name = "dev.everlooksoftware.com"
}

module "cluster-us-east-1" {
  source             = "../service"
  region             = "us-east-1"
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "cluster-us-west-1" {
  source             = "../service"
  region             = "us-west-1"
  availability_zones = ["us-west-1b", "us-west-1c"]
}

module "dns-us-east-1" {
  source             = "../dns"
  subdomain          = "dev"

  # this doesn't matter since route53 is global
  region             = "us-east-1"
  zone_id            = aws_route53_zone.primary.zone_id

  primary_alb_dns    = module.cluster-us-east-1.alb_dns
  primary_alb_zone   = module.cluster-us-east-1.alb_zone_id

  secondary_alb_dns  = module.cluster-us-west-1.alb_dns
  secondary_alb_zone = module.cluster-us-west-1.alb_zone_id
}