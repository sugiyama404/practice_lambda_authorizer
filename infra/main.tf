terraform {
  required_version = "=1.10.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# IAM
module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

# ECR
module "ecr" {
  source     = "./modules/ecr"
  app_name   = var.app_name
  image_name = var.image_name
}

# bash
module "bash" {
  source     = "./modules/bash"
  region     = var.region
  image_name = var.image_name
}

# App Runner
module "apprunner" {
  source                  = "./modules/apprunner"
  app_name                = var.app_name
  web_repository_url      = module.ecr.web_repository_url
  iam_role_app_runner_arn = module.iam.iam_role_app_runner_arn
}
