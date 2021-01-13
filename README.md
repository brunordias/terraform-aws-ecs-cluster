# AWS ECS Fargate Cluster
Terraform module which provides an ECS cluster powered by AWS Fargate.

## Terraform versions

Terraform >= 0.12

## Usage

```hcl
module "ecs_cluster" {
  source             = "brunordias/ecs-cluster/aws"
  version            = "~> 1.0.0"

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
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| capacity\_providers | List of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE\_SPOT. | `list` | `null` | no |
| container\_insights | Enable Container Insights. | `string` | `"disabled"` | no |
| default\_capacity\_provider\_strategy | The default capacity provider strategy configuration block. | `map` | `null` | no |
| name | The name of the cluster. | `string` | n/a | yes |
| tags | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The Amazon Resource Name (ARN) that identifies the cluster. |
