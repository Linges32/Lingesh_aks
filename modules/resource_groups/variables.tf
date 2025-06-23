variable "dfc_vtm_resource_groups" {
  description = "Name Token of the Resource Group. Final Format rg-dfc_vtm-<name>-<env>"
  type = list(object({
    name = string
  }))
  default = []
}
variable "common_variables" {
  description = "value of the common variables"
}
