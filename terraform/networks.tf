
resource "openstack_networking_network_v2" "provider_network" {
  name           = "provider_network"
  external       = true
  admin_state_up = true
  segments {
    physical_network = "physnet1"
    network_type     = "flat"
  }
}

resource "openstack_networking_subnet_v2" "provider_subnet" {
  network_id  = "${openstack_networking_network_v2.provider_network.id}"
  cidr        = "192.168.178.0/24"
  ip_version  = 4
  enable_dhcp = false
}

resource "openstack_networking_router_v2" "provider_router" {
  name                = "provider_router"
  admin_state_up      = true
  external_network_id = "${openstack_networking_network_v2.provider_network.id}"
  enable_snat         = true
  external_fixed_ip {
    subnet_id  = "${openstack_networking_subnet_v2.provider_subnet.id}"
    ip_address = "192.168.178.222"
  }
}

resource "openstack_networking_subnetpool_v2" "subnetpool_1010" {
  name              = "subnetpool_1010"
  ip_version        = 4
  prefixes          = ["10.10.0.0/16"]
  default_prefixlen = 24
  min_prefixlen     = 20
  max_prefixlen     = 30
}
