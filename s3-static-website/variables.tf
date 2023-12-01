variable "bucket" {
  type        = string
  description = "Bucket name"
}

variable "domain" {
  type        = string
  description = "Domain name"
}

variable "zone_id" {
  type        = string
  description = "Route53 zone ID in which to create the DNS records"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

