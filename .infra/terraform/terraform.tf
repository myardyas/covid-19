terraform {
  required_version = ">= 0.12"
  backend "gcs" {
    bucket = "terraform-covid2019-analytics"
    prefix = "covid19-state"
  }
}

provider "google" {
  version = "3.41.0"
  project = "covid2019-analytics"
  region  = "europe-west2"
}

