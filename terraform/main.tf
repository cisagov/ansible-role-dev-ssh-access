# Configure AWS
provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source = "git::https://github.com/cisagov/aws-parameter-store-read-only-iam-user-tf-module.git?ref=improvement/allow_wildcard_params"

  ssm_parameters = ["/cyhy/dev/users", "/ssh/public_keys/*"]
  user_name      = "test-ansible-role-dev-ssh-access"
  tags = {
    Team        = "NCATS OIS - Development"
    Application = "ansible-role-dev-ssh-access testing"
  }
}
