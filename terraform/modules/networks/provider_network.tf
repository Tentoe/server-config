resource "openstack_networking_network_v2" "provider_network" {
  name           = "provider"
  external       = true
  admin_state_up = true
  segments {
    physical_network = "physnet1"
    network_type     = "flat"
  }
}
resource "openstack_networking_subnet_v2" "provider_subnet" {
  name           = "provider"
  network_id  = openstack_networking_network_v2.provider_network.id
  cidr        = var.provider_cidr
  ip_version  = 4
  enable_dhcp = false
}


resource "openstack_networking_router_v2" "provider_router" {
  name                = "provider_router"
  admin_state_up      = true
  external_network_id = openstack_networking_network_v2.provider_network.id
  enable_snat         = true
  external_fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.provider_subnet.id
    ip_address = var.provider_router_ip
  }
}
