module "this" {
  #source      = "git@ci.alm.open-co.tech:data-engineer1/iac/modules/name_convention.git"
  source      = "../name_convention"
  environment = var.environment
  project     = var.project
  region      = var.region
  company     = var.company
}
