provider "google" {
  project = "terraform-nk"
  credentials = local.service_account_key
  region  = "us-central1"
}
data "google_secret_manager_secret_version" "service_account_key" {
  secret  = "s3-jenkins-tf-secret"
  version = "latest"
}
locals {
  service_account_key = base64decode(data.google_secret_manager_secret_version.service_account_key.secret_data)
}
resource "google_compute_network" "vpc_network" {
name = "terraform-nk-VPC"
}
resource "google_compute_subnetwork" "subnetwork1" {
name = "terraform-subnetwork-1"
ip_cidr_range = "10.1.0.0/16"
region = "us-central1"
network = google_compute_network.vpc_network.name
}
