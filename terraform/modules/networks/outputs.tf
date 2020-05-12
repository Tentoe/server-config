output "nets" {
  value = openstack_networking_network_v2.net
}
output "subnets" {
  value = openstack_networking_subnet_v2.subnet
}

output "subnet_pool" {
  value = openstack_networking_subnetpool_v2.pool
}

output "provider_router" {
  value = openstack_networking_router_v2.provider_router
}

output "provider_router_interfaces" {
  value = openstack_networking_router_interface_v2.net_router_if
}