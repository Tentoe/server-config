
resource "openstack_compute_instance_v2" "pihole" {

  name      = "pihole"
  flavor_id = openstack_compute_flavor_v2.micro.id
  key_pair  = openstack_compute_keypair_v2.default.id
  security_groups = [
    openstack_networking_secgroup_v2.all.name
  ]

  network {
    uuid = module.networks.nets["default"].id
  }

  block_device {
    uuid                  = openstack_images_image_v2.ubuntu_bionic.id
    source_type           = "image"
    volume_size           = 20
    destination_type      = "volume"
    delete_on_termination = true
  }
}

output "pihole_ip" {
  value = openstack_compute_instance_v2.pihole.access_ip_v4
}
