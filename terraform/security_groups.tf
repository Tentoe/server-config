resource "openstack_networking_secgroup_v2" "secgroup_icmp" {
  name = "Allow ICMP"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_icmp_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_icmp.id}"

}