resource "openstack_compute_instance_v2" "kube0" {

  name = "kube0"
  image_id        = data.openstack_images_image_v2.ubuntu_bionic_docker.id
  flavor_id       = openstack_compute_flavor_v2.medium.id
  key_pair        = openstack_compute_keypair_v2.default.id
  security_groups = [
    openstack_networking_secgroup_v2.all.name
    ]
 

  network {
    uuid = module.networks.nets["kube"].id
  }

}

output "kubeip"{
  value = openstack_compute_instance_v2.kube0.access_ip_v4
}