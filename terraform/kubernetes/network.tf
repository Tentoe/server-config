resource "openstack_networking_network_v2" "kube" {
  name           = "kube"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "kube" {
  prefix_length = 24
  network_id    = "${openstack_networking_network_v2.kube.id}"
  subnetpool_id = "${openstack_networking_subnetpool_v2.subnetpool_1010.id}"
}

resource "openstack_networking_router_interface_v2" "kube" {
  router_id = "${openstack_networking_router_v2.provider_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.kube.id}"
}