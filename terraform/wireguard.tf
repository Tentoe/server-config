
resource "openstack_networking_network_v2" "wireguard" {
  name           = "wireguard"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "wireguard" {
  name          = "wireguard"
  network_id    = openstack_networking_network_v2.wireguard.id
  cidr       = "10.11.0.0/16"
}

resource "openstack_networking_port_v2" "wireguard_gateway" {
  name                  = "wireguard_gateway"
  network_id            = openstack_networking_network_v2.wireguard.id
  admin_state_up        = "true"
  port_security_enabled = false

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.wireguard.id
    ip_address = openstack_networking_subnet_v2.wireguard.gateway_ip
  }
}

resource "openstack_networking_port_v2" "wireguard_firewall" {
  name                  = "wireguard_firewall"
  network_id            = module.networks.provider_net.id
  admin_state_up        = "true"
  port_security_enabled = false

  fixed_ip {
    subnet_id  = module.networks.provider_subnet.id
    ip_address = "192.168.178.244"
  }
}


resource "openstack_compute_instance_v2" "wireguard" {

  name      = "wireguard"
  flavor_id = openstack_compute_flavor_v2.fw.id
  key_pair  = openstack_compute_keypair_v2.default.id

  network {
    port = openstack_networking_port_v2.wireguard_firewall.id
  }

  network {
    port = openstack_networking_port_v2.wireguard_gateway.id
  }

  block_device {
    uuid                  = openstack_images_image_v2.opnsense.id
    source_type           = "image"
    volume_size           = 20
    destination_type      = "volume"
    delete_on_termination = true
  }

}

resource "openstack_dns_recordset_v2" "wireguard" {
  zone_id = openstack_dns_zone_v2.default.id
  name    = "${openstack_compute_instance_v2.wireguard.name}.${openstack_dns_zone_v2.default.name}"
  type    = "A"
  records = [openstack_compute_instance_v2.wireguard.access_ip_v4]
}

