variable "access_context_manager_service_perimeters" {
  description = <<EOT
Map of access_context_manager_service_perimeters, attributes below
Required:
    - parent
Optional:
    - deletion_policy
    - service_perimeters (block):
        - description (optional)
        - name (required)
        - perimeter_type (optional)
        - spec (optional, block):
            - access_levels (optional)
            - egress_policies (optional, block):
                - egress_from (optional, block):
                    - identities (optional)
                    - identity_type (optional)
                    - source_restriction (optional)
                    - sources (optional, block):
                        - access_level (optional)
                        - psc_endpoint (optional, block):
                            - forwarding_rule (optional)
                        - resource (optional)
                - egress_to (optional, block):
                    - external_resources (optional)
                    - operations (optional, block):
                        - method_selectors (optional, block):
                            - method (optional)
                            - permission (optional)
                        - service_name (optional)
                    - resources (optional)
                    - roles (optional)
                - title (optional)
            - ingress_policies (optional, block):
                - ingress_from (optional, block):
                    - identities (optional)
                    - identity_type (optional)
                    - sources (optional, block):
                        - access_level (optional)
                        - psc_endpoint (optional, block):
                            - forwarding_rule (optional)
                        - resource (optional)
                - ingress_to (optional, block):
                    - operations (optional, block):
                        - method_selectors (optional, block):
                            - method (optional)
                            - permission (optional)
                        - service_name (optional)
                    - resources (optional)
                    - roles (optional)
                - title (optional)
            - resources (optional)
            - restricted_services (optional)
            - vpc_accessible_services (optional, block):
                - allowed_service_patterns (optional, block):
                    - modifiers (optional, block):
                        - add_request_header (optional, block):
                            - key (required)
                            - value (required)
                    - pattern (optional)
                    - service (optional)
                - allowed_services (optional)
                - enable_restriction (optional)
                - service_patterns_enforcement_scopes (optional)
        - status (optional, block):
            - access_levels (optional)
            - egress_policies (optional, block):
                - egress_from (optional, block):
                    - identities (optional)
                    - identity_type (optional)
                    - source_restriction (optional)
                    - sources (optional, block):
                        - access_level (optional)
                        - psc_endpoint (optional, block):
                            - forwarding_rule (optional)
                        - resource (optional)
                - egress_to (optional, block):
                    - external_resources (optional)
                    - operations (optional, block):
                        - method_selectors (optional, block):
                            - method (optional)
                            - permission (optional)
                        - service_name (optional)
                    - resources (optional)
                    - roles (optional)
                - title (optional)
            - ingress_policies (optional, block):
                - ingress_from (optional, block):
                    - identities (optional)
                    - identity_type (optional)
                    - sources (optional, block):
                        - access_level (optional)
                        - psc_endpoint (optional, block):
                            - forwarding_rule (optional)
                        - resource (optional)
                - ingress_to (optional, block):
                    - operations (optional, block):
                        - method_selectors (optional, block):
                            - method (optional)
                            - permission (optional)
                        - service_name (optional)
                    - resources (optional)
                    - roles (optional)
                - title (optional)
            - resources (optional)
            - restricted_services (optional)
            - vpc_accessible_services (optional, block):
                - allowed_service_patterns (optional, block):
                    - modifiers (optional, block):
                        - add_request_header (optional, block):
                            - key (required)
                            - value (required)
                    - pattern (optional)
                    - service (optional)
                - allowed_services (optional)
                - enable_restriction (optional)
                - service_patterns_enforcement_scopes (optional)
        - title (required)
        - use_explicit_dry_run_spec (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    parent          = string
    deletion_policy = optional(string)
    service_perimeters = optional(list(object({
      description    = optional(string)
      name           = string
      perimeter_type = optional(string)
      spec = optional(object({
        access_levels = optional(set(string))
        egress_policies = optional(list(object({
          egress_from = optional(object({
            identities         = optional(set(string))
            identity_type      = optional(string)
            source_restriction = optional(string)
            sources = optional(list(object({
              access_level = optional(string)
              psc_endpoint = optional(object({
                forwarding_rule = optional(string)
              }))
              resource = optional(string)
            })))
          }))
          egress_to = optional(object({
            external_resources = optional(set(string))
            operations = optional(list(object({
              method_selectors = optional(list(object({
                method     = optional(string)
                permission = optional(string)
              })))
              service_name = optional(string)
            })))
            resources = optional(set(string))
            roles     = optional(set(string))
          }))
          title = optional(string)
        })))
        ingress_policies = optional(list(object({
          ingress_from = optional(object({
            identities    = optional(set(string))
            identity_type = optional(string)
            sources = optional(list(object({
              access_level = optional(string)
              psc_endpoint = optional(object({
                forwarding_rule = optional(string)
              }))
              resource = optional(string)
            })))
          }))
          ingress_to = optional(object({
            operations = optional(list(object({
              method_selectors = optional(list(object({
                method     = optional(string)
                permission = optional(string)
              })))
              service_name = optional(string)
            })))
            resources = optional(set(string))
            roles     = optional(set(string))
          }))
          title = optional(string)
        })))
        resources           = optional(set(string))
        restricted_services = optional(set(string))
        vpc_accessible_services = optional(object({
          allowed_service_patterns = optional(list(object({
            modifiers = optional(list(object({
              add_request_header = optional(object({
                key   = string
                value = string
              }))
            })))
            pattern = optional(string)
            service = optional(string)
          })))
          allowed_services                    = optional(set(string))
          enable_restriction                  = optional(bool)
          service_patterns_enforcement_scopes = optional(list(string))
        }))
      }))
      status = optional(object({
        access_levels = optional(set(string))
        egress_policies = optional(list(object({
          egress_from = optional(object({
            identities         = optional(set(string))
            identity_type      = optional(string)
            source_restriction = optional(string)
            sources = optional(list(object({
              access_level = optional(string)
              psc_endpoint = optional(object({
                forwarding_rule = optional(string)
              }))
              resource = optional(string)
            })))
          }))
          egress_to = optional(object({
            external_resources = optional(set(string))
            operations = optional(list(object({
              method_selectors = optional(list(object({
                method     = optional(string)
                permission = optional(string)
              })))
              service_name = optional(string)
            })))
            resources = optional(set(string))
            roles     = optional(set(string))
          }))
          title = optional(string)
        })))
        ingress_policies = optional(list(object({
          ingress_from = optional(object({
            identities    = optional(set(string))
            identity_type = optional(string)
            sources = optional(list(object({
              access_level = optional(string)
              psc_endpoint = optional(object({
                forwarding_rule = optional(string)
              }))
              resource = optional(string)
            })))
          }))
          ingress_to = optional(object({
            operations = optional(list(object({
              method_selectors = optional(list(object({
                method     = optional(string)
                permission = optional(string)
              })))
              service_name = optional(string)
            })))
            resources = optional(set(string))
            roles     = optional(set(string))
          }))
          title = optional(string)
        })))
        resources           = optional(set(string))
        restricted_services = optional(set(string))
        vpc_accessible_services = optional(object({
          allowed_service_patterns = optional(list(object({
            modifiers = optional(list(object({
              add_request_header = optional(object({
                key   = string
                value = string
              }))
            })))
            pattern = optional(string)
            service = optional(string)
          })))
          allowed_services                    = optional(set(string))
          enable_restriction                  = optional(bool)
          service_patterns_enforcement_scopes = optional(list(string))
        }))
      }))
      title                     = string
      use_explicit_dry_run_spec = optional(bool)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

