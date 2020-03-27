
resource "openstack_networking_subnetpool_v2" "pool" {
  name              = "subnetpool"
  ip_version        = 4
  prefixes          = var.pool_prefixes
  default_prefixlen = 24
  min_prefixlen     = 20
  max_prefixlen     = 30
}

