resource "openstack_compute_instance_v2" "kube_master" {

  name      = "kube-master-0"
  flavor_id = openstack_compute_flavor_v2.medium.id
  key_pair  = openstack_compute_keypair_v2.default.id
  security_groups = [
    openstack_networking_secgroup_v2.all.name
  ]

  network {
    uuid = module.networks.nets["kube"].id
  }

  block_device {
    uuid                  = openstack_images_image_v2.ubuntu_bionic.id
    source_type           = "image"
    volume_size           = 50
    destination_type      = "volume"
    delete_on_termination = true
  }
}


resource "openstack_compute_instance_v2" "kube_worker0" {

  name      = "kube-worker-0"
  flavor_id = openstack_compute_flavor_v2.medium.id
  key_pair  = openstack_compute_keypair_v2.default.id
  security_groups = [
    openstack_networking_secgroup_v2.all.name
  ]

  network {
    uuid = module.networks.nets["kube"].id
  }

  block_device {
    uuid                  = openstack_images_image_v2.ubuntu_bionic.id
    source_type           = "image"
    volume_size           = 50
    destination_type      = "volume"
    delete_on_termination = true
  }
}

output "kube_master_ip" {
  value = openstack_compute_instance_v2.kube_master.access_ip_v4
}

output "kube_worker_ip" {
  value = openstack_compute_instance_v2.kube_worker0.access_ip_v4
}
