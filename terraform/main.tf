resource "digitalocean_vpc" "bulletins" {
  name     = "bulletins-application-vpc"
  region   = var.region
  ip_range = "10.111.10.0/24"
}
