resource "openstack_compute_instance_v2" "kubemaster0" {

  name      = "kubemaster0"
  flavor_id = openstack_compute_flavor_v2.medium.id
  key_pair  = openstack_compute_keypair_v2.default.id


  network {
    port = openstack_networking_port_v2.kubemaster0.id
  }

  block_device {
    uuid                  = openstack_images_image_v2.ubuntu_bionic.id
    source_type           = "image"
    volume_size           = 50
    destination_type      = "volume"
    delete_on_termination = true
  }
}

resource "openstack_networking_port_v2" "kubemaster0" {
  name                  = "kubemaster0"
  network_id            = openstack_networking_network_v2.wireguard.id
  admin_state_up        = "true"
  port_security_enabled = false
}

resource "openstack_dns_recordset_v2" "kubemaster0" {
  zone_id = openstack_dns_zone_v2.default.id
  name    = "${openstack_compute_instance_v2.kubemaster0.name}.${openstack_dns_zone_v2.default.name}"
  type    = "A"
  records = [openstack_compute_instance_v2.kubemaster0.access_ip_v4]
}

resource "openstack_compute_instance_v2" "kubeworker0" {

  name      = "kubeworker0"
  flavor_id = openstack_compute_flavor_v2.medium.id
  key_pair  = openstack_compute_keypair_v2.default.id


  network {
    port = openstack_networking_port_v2.kubeworker0.id
  }

  block_device {
    uuid                  = openstack_images_image_v2.ubuntu_bionic.id
    source_type           = "image"
    volume_size           = 50
    destination_type      = "volume"
    delete_on_termination = true
  }
}

resource "openstack_networking_port_v2" "kubeworker0" {
  name                  = "kubeworker0"
  network_id            = openstack_networking_network_v2.wireguard.id
  admin_state_up        = "true"
  port_security_enabled = false
}

resource "openstack_dns_recordset_v2" "kubeworker0" {
  zone_id = openstack_dns_zone_v2.default.id
  name    = "${openstack_compute_instance_v2.kubeworker0.name}.${openstack_dns_zone_v2.default.name}"
  type    = "A"
  records = [openstack_compute_instance_v2.kubeworker0.access_ip_v4]
}

