provider "openstack" {
  cloud = "openstack"
}

data "openstack_identity_project_v3" "project" {
  name = var.project_name
}
module "networks" {
  source        = "./modules/networks"
  network_names = ["default", "ceph", "kube"]
}
