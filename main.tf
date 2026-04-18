module "folders" {
  source = "./folders"
}

module "projects" {
  source = "./projects"

  project_name = "terraform-project"
  folder_id    = module.folders.sub_tf_1_id
  billing_account_id = "01F0FD-8F1100-E81B54"
}

module "compute" {
  source = "./compute"

  project_id = module.projects.project_id
  vpc_network_name = module.networks.vpc_network_name
  sub_vpc_network_name = module.networks.sub_vpc_network_name
}

module "networks" {
  source = "./networks"

  project_id = module.projects.project_id
}