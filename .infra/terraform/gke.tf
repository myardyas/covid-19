resource "google_container_cluster" "scope" {
  name                     = "covid19"
  location                 = "europe-west2-b"
  remove_default_node_pool = true
  initial_node_count       = 1
  min_master_version       = "1.17"
}

resource "google_container_node_pool" "scope" {
  name       = "covid19-node-pool"
  location   = "europe-west2-b"
  cluster    = google_container_cluster.scope.name
  node_count = 2
  version    = "1.17.12-gke.500"

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "storage-ro",
      "logging-write",
      "monitoring"
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = false
  }
}

