
resource "openstack_networking_network_v2" "wireguard" {
  name           = "wireguard"
  admin_state_up = "true"
  dns_domain     = "local.kurz.site."
}

resource "openstack_networking_subnet_v2" "wireguard" {
  name          = "wireguard"
  prefix_length = 24
  network_id    = openstack_networking_network_v2.wireguard.id
  subnetpool_id = module.networks.subnet_pool.id
}

resource "openstack_networking_port_v2" "wireguard_gateway" {
  name           = "wireguard_gateway"
  network_id     = openstack_networking_network_v2.wireguard.id
  admin_state_up = "true"
  port_security_enabled = false

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.wireguard.id
    ip_address = openstack_networking_subnet_v2.wireguard.gateway_ip
  }
}

resource "openstack_networking_port_v2" "gateway_to_wireguard" {
  name           = "gateway_to_wireguard"
  network_id     = module.networks.nets["default"].id
  admin_state_up = "true"
  port_security_enabled = false

}


resource "openstack_networking_router_route_v2" "wireguard" {
  depends_on       = [ module.networks ]
  router_id        = module.networks.provider_router.id
  destination_cidr = openstack_networking_subnet_v2.wireguard.cidr
  next_hop         = openstack_compute_instance_v2.wireguard.access_ip_v4
}


resource "openstack_compute_instance_v2" "wireguard" {

  name      = "wireguard"
  flavor_id = openstack_compute_flavor_v2.micro.id
  key_pair  = openstack_compute_keypair_v2.default.id
  security_groups = [
    openstack_networking_secgroup_v2.all.name
  ]

  network {
    port = openstack_networking_port_v2.gateway_to_wireguard.id
  }

  network {
    port = openstack_networking_port_v2.wireguard_gateway.id
  }

  block_device {
    uuid                  = openstack_images_image_v2.ubuntu_bionic.id
    source_type           = "image"
    volume_size           = 10
    destination_type      = "volume"
    delete_on_termination = true
  }
}

resource "openstack_dns_recordset_v2" "wireguard" {
  zone_id = openstack_dns_zone_v2.default.id
  name    = "wireguard.${openstack_dns_zone_v2.default.name}"
  type    = "A"
  records = [openstack_compute_instance_v2.wireguard.access_ip_v4]
}
