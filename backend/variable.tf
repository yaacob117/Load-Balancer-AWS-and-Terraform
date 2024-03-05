variable "access_key" {
  type    = string
  default = "YOUR_ACCESS_KEY"
}
variable "secret_key" {
  type    = string
  default = "YOUR_SECRET_KEY"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "bucket_name" {
  type    = string
  default = "terra-tfstate-222"
}
variable "dynamo-db-name" {
  type    = string
  default = "terra-statelock-2228"
}
