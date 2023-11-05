terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.3"
    }
  }
}

provider "aws" {
  region  = local.region
  access_key = local.access_key
  secret_key = local.secret_key

}
