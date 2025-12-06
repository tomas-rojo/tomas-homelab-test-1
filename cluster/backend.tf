terraform {
  backend "gcs" {
    bucket = "trojo-tf-state"
    prefix = "tf-infra"
  }
}
