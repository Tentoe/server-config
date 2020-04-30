
resource "openstack_compute_instance_v2" "docker_compose" {

  name      = "docker-copose-host"
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

output "docker_compose_ip" {
  value = openstack_compute_instance_v2.docker_compose.access_ip_v4
}
