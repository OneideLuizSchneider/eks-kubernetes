terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73"
    }
  }
}

provider "aws" {
  region     = local.region
  access_key = local.access_key
  secret_key = local.secret_key

}
