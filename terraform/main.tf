provider "openstack" {
  auth_url    = "http://julia.fritz.box:5000"
  user_name   = "kkurz"
  tenant_name = "main"
  domain_name = "Default"
  password    = var.password
}

data "openstack_identity_project_v3" "project" {
  name = var.project_name
}
module "networks" {
  source        = "./modules/networks"
  network_names = ["default", "ceph", "kube"]
}

resource "openstack_dns_zone_v2" "default" {
  name        = "local.kurz.site."
  email       = "tentoe86@gmail.com"
  ttl         = 180
  type        = "PRIMARY"
}