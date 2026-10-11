resource "google_access_context_manager_service_perimeters" "access_context_manager_service_perimeters" {
  for_each = var.access_context_manager_service_perimeters

  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy

  dynamic "service_perimeters" {
    for_each = each.value.service_perimeters != null ? each.value.service_perimeters : []
    content {
      description    = service_perimeters.value.description
      name           = service_perimeters.value.name
      perimeter_type = service_perimeters.value.perimeter_type
      dynamic "spec" {
        for_each = service_perimeters.value.spec != null ? [service_perimeters.value.spec] : []
        content {
          access_levels = spec.value.access_levels
          dynamic "egress_policies" {
            for_each = spec.value.egress_policies != null ? spec.value.egress_policies : []
            content {
              dynamic "egress_from" {
                for_each = egress_policies.value.egress_from != null ? [egress_policies.value.egress_from] : []
                content {
                  identities         = egress_from.value.identities
                  identity_type      = egress_from.value.identity_type
                  source_restriction = egress_from.value.source_restriction
                  dynamic "sources" {
                    for_each = egress_from.value.sources != null ? egress_from.value.sources : []
                    content {
                      access_level = sources.value.access_level
                      dynamic "psc_endpoint" {
                        for_each = sources.value.psc_endpoint != null ? [sources.value.psc_endpoint] : []
                        content {
                          forwarding_rule = psc_endpoint.value.forwarding_rule
                        }
                      }
                      resource = sources.value.resource
                    }
                  }
                }
              }
              dynamic "egress_to" {
                for_each = egress_policies.value.egress_to != null ? [egress_policies.value.egress_to] : []
                content {
                  external_resources = egress_to.value.external_resources
                  dynamic "operations" {
                    for_each = egress_to.value.operations != null ? egress_to.value.operations : []
                    content {
                      dynamic "method_selectors" {
                        for_each = operations.value.method_selectors != null ? operations.value.method_selectors : []
                        content {
                          method     = method_selectors.value.method
                          permission = method_selectors.value.permission
                        }
                      }
                      service_name = operations.value.service_name
                    }
                  }
                  resources = egress_to.value.resources
                  roles     = egress_to.value.roles
                }
              }
              title = egress_policies.value.title
            }
          }
          dynamic "ingress_policies" {
            for_each = spec.value.ingress_policies != null ? spec.value.ingress_policies : []
            content {
              dynamic "ingress_from" {
                for_each = ingress_policies.value.ingress_from != null ? [ingress_policies.value.ingress_from] : []
                content {
                  identities    = ingress_from.value.identities
                  identity_type = ingress_from.value.identity_type
                  dynamic "sources" {
                    for_each = ingress_from.value.sources != null ? ingress_from.value.sources : []
                    content {
                      access_level = sources.value.access_level
                      dynamic "psc_endpoint" {
                        for_each = sources.value.psc_endpoint != null ? [sources.value.psc_endpoint] : []
                        content {
                          forwarding_rule = psc_endpoint.value.forwarding_rule
                        }
                      }
                      resource = sources.value.resource
                    }
                  }
                }
              }
              dynamic "ingress_to" {
                for_each = ingress_policies.value.ingress_to != null ? [ingress_policies.value.ingress_to] : []
                content {
                  dynamic "operations" {
                    for_each = ingress_to.value.operations != null ? ingress_to.value.operations : []
                    content {
                      dynamic "method_selectors" {
                        for_each = operations.value.method_selectors != null ? operations.value.method_selectors : []
                        content {
                          method     = method_selectors.value.method
                          permission = method_selectors.value.permission
                        }
                      }
                      service_name = operations.value.service_name
                    }
                  }
                  resources = ingress_to.value.resources
                  roles     = ingress_to.value.roles
                }
              }
              title = ingress_policies.value.title
            }
          }
          resources           = spec.value.resources
          restricted_services = spec.value.restricted_services
          dynamic "vpc_accessible_services" {
            for_each = spec.value.vpc_accessible_services != null ? [spec.value.vpc_accessible_services] : []
            content {
              dynamic "allowed_service_patterns" {
                for_each = vpc_accessible_services.value.allowed_service_patterns != null ? vpc_accessible_services.value.allowed_service_patterns : []
                content {
                  dynamic "modifiers" {
                    for_each = allowed_service_patterns.value.modifiers != null ? allowed_service_patterns.value.modifiers : []
                    content {
                      dynamic "add_request_header" {
                        for_each = modifiers.value.add_request_header != null ? [modifiers.value.add_request_header] : []
                        content {
                          key   = add_request_header.value.key
                          value = add_request_header.value.value
                        }
                      }
                    }
                  }
                  pattern = allowed_service_patterns.value.pattern
                  service = allowed_service_patterns.value.service
                }
              }
              allowed_services                    = vpc_accessible_services.value.allowed_services
              enable_restriction                  = vpc_accessible_services.value.enable_restriction
              service_patterns_enforcement_scopes = vpc_accessible_services.value.service_patterns_enforcement_scopes
            }
          }
        }
      }
      dynamic "status" {
        for_each = service_perimeters.value.status != null ? [service_perimeters.value.status] : []
        content {
          access_levels = status.value.access_levels
          dynamic "egress_policies" {
            for_each = status.value.egress_policies != null ? status.value.egress_policies : []
            content {
              dynamic "egress_from" {
                for_each = egress_policies.value.egress_from != null ? [egress_policies.value.egress_from] : []
                content {
                  identities         = egress_from.value.identities
                  identity_type      = egress_from.value.identity_type
                  source_restriction = egress_from.value.source_restriction
                  dynamic "sources" {
                    for_each = egress_from.value.sources != null ? egress_from.value.sources : []
                    content {
                      access_level = sources.value.access_level
                      dynamic "psc_endpoint" {
                        for_each = sources.value.psc_endpoint != null ? [sources.value.psc_endpoint] : []
                        content {
                          forwarding_rule = psc_endpoint.value.forwarding_rule
                        }
                      }
                      resource = sources.value.resource
                    }
                  }
                }
              }
              dynamic "egress_to" {
                for_each = egress_policies.value.egress_to != null ? [egress_policies.value.egress_to] : []
                content {
                  external_resources = egress_to.value.external_resources
                  dynamic "operations" {
                    for_each = egress_to.value.operations != null ? egress_to.value.operations : []
                    content {
                      dynamic "method_selectors" {
                        for_each = operations.value.method_selectors != null ? operations.value.method_selectors : []
                        content {
                          method     = method_selectors.value.method
                          permission = method_selectors.value.permission
                        }
                      }
                      service_name = operations.value.service_name
                    }
                  }
                  resources = egress_to.value.resources
                  roles     = egress_to.value.roles
                }
              }
              title = egress_policies.value.title
            }
          }
          dynamic "ingress_policies" {
            for_each = status.value.ingress_policies != null ? status.value.ingress_policies : []
            content {
              dynamic "ingress_from" {
                for_each = ingress_policies.value.ingress_from != null ? [ingress_policies.value.ingress_from] : []
                content {
                  identities    = ingress_from.value.identities
                  identity_type = ingress_from.value.identity_type
                  dynamic "sources" {
                    for_each = ingress_from.value.sources != null ? ingress_from.value.sources : []
                    content {
                      access_level = sources.value.access_level
                      dynamic "psc_endpoint" {
                        for_each = sources.value.psc_endpoint != null ? [sources.value.psc_endpoint] : []
                        content {
                          forwarding_rule = psc_endpoint.value.forwarding_rule
                        }
                      }
                      resource = sources.value.resource
                    }
                  }
                }
              }
              dynamic "ingress_to" {
                for_each = ingress_policies.value.ingress_to != null ? [ingress_policies.value.ingress_to] : []
                content {
                  dynamic "operations" {
                    for_each = ingress_to.value.operations != null ? ingress_to.value.operations : []
                    content {
                      dynamic "method_selectors" {
                        for_each = operations.value.method_selectors != null ? operations.value.method_selectors : []
                        content {
                          method     = method_selectors.value.method
                          permission = method_selectors.value.permission
                        }
                      }
                      service_name = operations.value.service_name
                    }
                  }
                  resources = ingress_to.value.resources
                  roles     = ingress_to.value.roles
                }
              }
              title = ingress_policies.value.title
            }
          }
          resources           = status.value.resources
          restricted_services = status.value.restricted_services
          dynamic "vpc_accessible_services" {
            for_each = status.value.vpc_accessible_services != null ? [status.value.vpc_accessible_services] : []
            content {
              dynamic "allowed_service_patterns" {
                for_each = vpc_accessible_services.value.allowed_service_patterns != null ? vpc_accessible_services.value.allowed_service_patterns : []
                content {
                  dynamic "modifiers" {
                    for_each = allowed_service_patterns.value.modifiers != null ? allowed_service_patterns.value.modifiers : []
                    content {
                      dynamic "add_request_header" {
                        for_each = modifiers.value.add_request_header != null ? [modifiers.value.add_request_header] : []
                        content {
                          key   = add_request_header.value.key
                          value = add_request_header.value.value
                        }
                      }
                    }
                  }
                  pattern = allowed_service_patterns.value.pattern
                  service = allowed_service_patterns.value.service
                }
              }
              allowed_services                    = vpc_accessible_services.value.allowed_services
              enable_restriction                  = vpc_accessible_services.value.enable_restriction
              service_patterns_enforcement_scopes = vpc_accessible_services.value.service_patterns_enforcement_scopes
            }
          }
        }
      }
      title                     = service_perimeters.value.title
      use_explicit_dry_run_spec = service_perimeters.value.use_explicit_dry_run_spec
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

