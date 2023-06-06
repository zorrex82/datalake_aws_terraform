################################################################################
# Custom context
################################################################################

output "custom_context" {
  value       = module.custom.context
  description = "Custom context for naming based on inputs passed. Context with variables from the `cloudposse/label/null` module. Does not consider services."
}

output "datalake_context" {
  value       = local.datalake_context
  description = "Custom context for naming based on inputs passed. Context with standard Datalake variables: `region` `component_name` `environment`. Does not consider services."
}

output "custom_context_id" {
  value       = module.custom.id
  description = "Custom context ID string for naming based on inputs passed. Does not consider services."
}