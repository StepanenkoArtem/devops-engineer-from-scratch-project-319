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
