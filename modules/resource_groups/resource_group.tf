resource "azurerm_resource_group" "dfc_vtm_resource_groups" {
  for_each = { for group in var.dfc_vtm_resource_groups : group.name => group }
  name     = "rg-${var.common_variables.project_name}-${each.value.name}-${var.common_variables.environment}"
  location = var.common_variables.default_location
  tags     = var.common_variables.tags
}
