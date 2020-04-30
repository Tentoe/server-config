output "nets" {
  value = openstack_networking_network_v2.net
}
output "subnets" {
  value = openstack_networking_subnet_v2.subnet
}

output "router" {
  value = openstack_networking_router_v2.provider_router
}