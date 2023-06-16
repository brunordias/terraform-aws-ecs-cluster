# AWS ECS Fargate Cluster
Terraform module which provides an ECS cluster powered by AWS Fargate.

## Usage

```hcl
module "ecs_cluster" {
  source             = "brunordias/ecs-cluster/aws"
  version            = "~> 2.0.0"

  name               = "terraform-ecs-test"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy = {
    capacity_provider = "FARGATE_SPOT"
    weight            = 5
    base              = 1
  }
  container_insights = "enabled"
  tags = {
    environment = "development"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | List of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE\_SPOT. | `list(any)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Enable Container Insights. Value values are enabled and disabled. | `string` | `"disabled"` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | The default capacity provider strategy configuration block. | `map(any)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Amazon Resource Name (ARN) that identifies the cluster. |
