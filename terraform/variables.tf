variable "do_token" {
  type        = string
  description = "DigitalOcean Token"
  sensitive   = true
  ephemeral   = true
}

variable "region" {
  type        = string
  description = "Region for the application infrastructure"
  default     = "lon1"
}
