provider "google" {
  project = "terraform-nk"
  region  = "us-central1"
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
