provider "aws" {
  region = "us-east-1"
}

module "ecs_cluster" {
  source             = "../../"
  name               = "terraform-ecs-test"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy = {
    capacity_provider = "FARGATE_SPOT"
    weight            = null
    base              = null
  }
  container_insights = "enabled"
  tags = {
    environment = "development"
  }
}
