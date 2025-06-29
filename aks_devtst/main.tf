# Read me first for the dfcvtm_aks_cluster module 
# This module in turn calls the Azure Platform Team's Terraform module. To create AKS cluster, person running this terraform will need to activate Role: js_aks_contributor via - https://azure.js-devops.co.uk/access
# After Terraform init, when it loads the platform teams aks module. To cater to certain requirements, some manual updates have been done within the .terraform section. These have been captured in confluence page - Please refer to this prior to execution of this TF
module "common_variables" {
  source           = "../modules/common"
  common_tags      = var.common_tags
  environment      = var.environment
  default_location = var.default_location
  project_name     = var.project_name
  tenant_id        = var.tenant_id
}

module "dfcvtm_resource_groups" {
  source              = "../modules/resource_groups"
  dfcvtm_resource_groups = var.dfcvtm_resource_groups
  common_variables    = module.common_variables
}

module "dfcvtm_aks_cluster" {
  source                 = "../modules/aks_cluster"
  dfcvtm_aks                = var.dfcvtm_aks
  aks_resourcegroup_name = module.dfcvtm_resource_groups.dfcvtm_resource_groups["aks"].name
  common_variables       = module.common_variables
}
