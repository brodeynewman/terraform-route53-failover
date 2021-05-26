variable region {
  type        = string
  description = "AWS region"
}

variable subdomain {
  type        = string
  description = "Subdomain for our cluster"
}

variable zone_id {
  type        = string
  description = "Our route53 hosted zone_id"
}

variable primary_alb_dns {
  type        = string
  description = "The DNS of our primary cluster's ALB (us-east-1)"
}

variable secondary_alb_dns {
  type        = string
  description = "The DNS of our secondary cluster's ALB (us-west-1)"
}

variable primary_alb_zone {
  type        = string
  description = "The zone_id of our primary cluster's ALB (us-east-1)"
}

variable secondary_alb_zone {
  type        = string
  description = "The zone_id of our secondary cluster's ALB (us-west-1)"
}

