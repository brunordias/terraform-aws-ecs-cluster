resource aws_ecs_cluster main {
  name = var.name

  capacity_providers = var.capacity_providers

  setting {
    name  = "containerInsights"
    value = var.container_insights
  }

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy != null ? [1] : []

    content {
      capacity_provider = var.default_capacity_provider_strategy.capacity_provider
      weight            = var.default_capacity_provider_strategy.weight
      base              = var.default_capacity_provider_strategy.base
    }
  }

  tags = var.tags
}
