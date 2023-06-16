variable "name" {
  type        = string
  description = "The name of the cluster."
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "container_insights" {
  type        = string
  default     = "disabled"
  description = "Enable Container Insights. Value values are enabled and disabled."
}

variable "capacity_providers" {
  type        = list(any)
  default     = ["FARGATE", "FARGATE_SPOT"]
  description = "List of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT."
}

variable "default_capacity_provider_strategy" {
  type        = map(any)
  default     = null
  description = "The default capacity provider strategy configuration block."
}
