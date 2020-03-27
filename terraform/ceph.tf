

resource "openstack_compute_instance_v2" "ceph_mon" {
  name            = "ceph_mon"

  image_id        = data.openstack_images_image_v2.ubuntu_bionic_docker.id
  flavor_id       = openstack_compute_flavor_v2.medium.id
  key_pair        = openstack_compute_keypair_v2.default.id
  security_groups = [
    openstack_networking_secgroup_v2.all.name
    ]
 

  network {
    uuid = module.networks.ids["ceph"]
  }

}

resource "openstack_blockstorage_volume_v2" "ceph_mon" {
  name = "ceph_mon"
  size = 50
}

resource "openstack_compute_volume_attach_v2" "ceph_mon" {
  instance_id = openstack_compute_instance_v2.ceph_mon.id
  volume_id   = openstack_blockstorage_volume_v2.ceph_mon.id
}

resource "openstack_blockstorage_volume_v2" "ceph_mon2" {
  name = "ceph_mon"
  size = 50
}

resource "openstack_compute_volume_attach_v2" "ceph_mon2" {
  instance_id = openstack_compute_instance_v2.ceph_mon.id
  volume_id   = openstack_blockstorage_volume_v2.ceph_mon2.id
}

resource "openstack_blockstorage_volume_v2" "ceph_mon3" {
  name = "ceph_mon"
  size = 50
}

resource "openstack_compute_volume_attach_v2" "ceph_mon3" {
  instance_id = openstack_compute_instance_v2.ceph_mon.id
  volume_id   = openstack_blockstorage_volume_v2.ceph_mon3.id
}

output "ceph_mon_ip" {
  value = openstack_compute_instance_v2.ceph_mon.access_ip_v4
}


