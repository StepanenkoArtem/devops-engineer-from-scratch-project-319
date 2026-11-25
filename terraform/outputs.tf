output "cluster_id" {
  description = "DOKS cluster ID. Pass it to `doctl kubernetes cluster kubeconfig save` for personal kubectl access."
  value       = digitalocean_kubernetes_cluster.bulletins.id
}

output "kubeconfig" {
  description = "Admin kubeconfig for automation. Its token expires in 7 days; re-run apply to refresh it. People should use doctl instead."
  value       = digitalocean_kubernetes_cluster.bulletins.kube_config[0].raw_config
  sensitive   = true
}

output "node_pool_id" {
  description = "ID of the cluster's default node pool."
  value       = digitalocean_kubernetes_cluster.bulletins.node_pool[0].id
}

output "app_database_jdbc_url" {
  description = "JDBC URL of the app database over the VPC private network, with TLS required. Only the DOKS cluster can reach it."
  value       = "jdbc:postgresql://${local.db_host}:${local.db_port}/${local.db_name}?sslmode=require"
}

output "app_database_user" {
  description = "Database user the app connects as. It has the normal role, not the doadmin admin role."
  value       = digitalocean_database_user.bulletins.name
}

output "app_database_password" {
  description = "Password of the app database user. It sits in the state in plain text, like the kubeconfig."
  value       = digitalocean_database_user.bulletins.password
  sensitive   = true
}

locals {
  db_host = digitalocean_database_cluster.bulletins.private_host
  db_port = digitalocean_database_cluster.bulletins.port
  db_name = digitalocean_database_db.bulletins.name
}
