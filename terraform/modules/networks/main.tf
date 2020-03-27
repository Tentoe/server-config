
resource "openstack_networking_network_v2" "net" {
  for_each       = toset(var.network_names)
  name           = each.value
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  for_each      = toset(var.network_names)
  prefix_length = 24
  network_id    = openstack_networking_network_v2.net[each.value].id
  subnetpool_id = openstack_networking_subnetpool_v2.pool.id
}

resource "openstack_networking_router_interface_v2" "net_router_if" {
  for_each  = toset(var.network_names)
  router_id = openstack_networking_router_v2.provider_router.id
  subnet_id = openstack_networking_subnet_v2.subnet[each.value].id
}

