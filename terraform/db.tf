resource "digitalocean_database_cluster" "bulletins" {
  name                 = "${local.project}-db"
  engine               = "pg"
  version              = "18"
  size                 = "db-s-1vcpu-1gb"
  region               = var.region
  node_count           = 1
  private_network_uuid = digitalocean_vpc.bulletins.id
}

resource "digitalocean_database_firewall" "bulletins" {
  cluster_id = digitalocean_database_cluster.bulletins.id

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.bulletins.id
  }
}

resource "digitalocean_database_db" "bulletins" {
  cluster_id = digitalocean_database_cluster.bulletins.id
  name       = local.project
}

resource "digitalocean_database_user" "bulletins" {
  cluster_id = digitalocean_database_cluster.bulletins.id
  name       = local.project
}

