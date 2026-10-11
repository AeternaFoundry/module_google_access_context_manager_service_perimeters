output "access_context_manager_service_perimeters_id" {
  description = "Map of id values across all access_context_manager_service_perimeters, keyed the same as var.access_context_manager_service_perimeters except keys with no id are omitted"
  value       = { for k, v in google_access_context_manager_service_perimeters.access_context_manager_service_perimeters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "access_context_manager_service_perimeters_deletion_policy" {
  description = "Map of deletion_policy values across all access_context_manager_service_perimeters, keyed the same as var.access_context_manager_service_perimeters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_access_context_manager_service_perimeters.access_context_manager_service_perimeters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "access_context_manager_service_perimeters_parent" {
  description = "Map of parent values across all access_context_manager_service_perimeters, keyed the same as var.access_context_manager_service_perimeters except keys with no parent are omitted"
  value       = { for k, v in google_access_context_manager_service_perimeters.access_context_manager_service_perimeters : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "access_context_manager_service_perimeters_service_perimeters" {
  description = "Map of service_perimeters values across all access_context_manager_service_perimeters, keyed the same as var.access_context_manager_service_perimeters except keys with no service_perimeters are omitted"
  value       = { for k, v in google_access_context_manager_service_perimeters.access_context_manager_service_perimeters : k => v.service_perimeters if v.service_perimeters != null && length(v.service_perimeters) > 0 }
}

