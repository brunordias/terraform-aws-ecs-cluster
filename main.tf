resource "aws_ecs_cluster" "main" {
  name = var.name

  setting {
    name  = "containerInsights"
    value = var.container_insights
  }

  tags = var.tags
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy != null ? [1] : []

    content {
      capacity_provider = var.default_capacity_provider_strategy.capacity_provider
      weight            = lookup(var.default_capacity_provider_strategy, "weight", 0)
      base              = lookup(var.default_capacity_provider_strategy, "base", 0)
    }
  }
}