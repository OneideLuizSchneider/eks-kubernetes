provider "aws" {
  version = "~> 3.37"

  region  = local.region
  access_key = local.access_key
  secret_key = local.secret_key

}
