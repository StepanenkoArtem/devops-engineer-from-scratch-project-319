resource "digitalocean_vpc" "bulletins" {
  name     = "${local.project}-application-vpc"
  region   = var.region
  ip_range = "10.111.10.0/24"
}

resource "digitalocean_kubernetes_cluster" "bulletins" {
  name         = "${local.project}-cluster"
  region       = var.region
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.bulletins.latest_version
  vpc_uuid     = digitalocean_vpc.bulletins.id
  ha           = false

  maintenance_policy {
    start_time = "01:00"
    day        = "sunday"
  }

  node_pool {
    name       = "${local.project}-pool"
    size       = "s-2vcpu-4gb"
    node_count = 1
  }
}

data "digitalocean_kubernetes_versions" "bulletins" {
  version_prefix = "1.37."
}
