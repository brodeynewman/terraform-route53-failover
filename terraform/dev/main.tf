module "cluster-us-east-1" {
  source    = "../service"
  region    = "us-east-1"
  subdomain = "dev"
}

# module "cluster-us-west-1" {
#   source = "./service"
#   region = "us-west-1"
# }